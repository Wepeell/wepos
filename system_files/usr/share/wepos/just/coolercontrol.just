# Add kernel argument to enable all features for AMD GPUs
[group('CoolerControl')]
append-karg:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Add karg
	echo "Adding karg to enable all features for AMD GPUs..."
	echo
	rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff
	echo
	
	# Check karg
	if rpm-ostree kargs | grep -q 'amdgpu.ppfeaturemask=0xffffffff'; then
		echo "Kernel argument successfully added."
		echo "Please reboot to apply changes."
		echo
	else
		echo "Failed to add kernel argument." >&2
		echo
		exit 1
	fi

# Remove the kernel argument for AMD GPUs
[group('CoolerControl')]
delete-karg:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Remove karg
	echo "Removing karg for AMD GPUs..."
	echo
	rpm-ostree kargs --delete=amdgpu.ppfeaturemask=0xffffffff || true
	echo
	
	# Check karg
	if rpm-ostree kargs | grep -q 'amdgpu.ppfeaturemask=0xffffffff'; then
		echo "Kernel argument still present, removal may have failed." >&2
		echo
		exit 1
	else
		echo "Kernel argument successfully removed."
		echo "Please reboot to apply changes."
		echo
	fi

# Load and install the "nct6775" kernel module for "ASUS ROG Strix B650E-F Gaming Wifi"
[group('CoolerControl')]
install-nct6775:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Info about the kernel module for ASUS motherboards
	# https://github.com/lm-sensors/lm-sensors/issues/416#issuecomment-2359409670
	
	# Load kernel module on booted system
	# echo "Loading nct6775 kernel module..."
	# sudo modprobe nct6775
	
	# Install kernel module for persistence across reboots
	echo "Installing nct6775 kernel module for automatic loading on boot..."
	sudo mkdir -p /etc/modules-load.d
	echo "nct6775" | sudo tee /etc/modules-load.d/nct6775.conf > /dev/null
	
	# Verify installation
	if grep -Fxq 'nct6775' /etc/modules-load.d/nct6775.conf; then
		echo "Kernel module nct6775 installation complete."
		echo "Please reboot to test if the module loads automatically."
	else
		echo "Failed to install nct6775 kernel module for persistent loading." >&2
		exit 1
	fi

# Uninstall the "nct6775" kernel module for "ASUS ROG Strix B650E-F Gaming Wifi"
[group('CoolerControl')]
uninstall-nct6775:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Remove the nct6775 kernel module
	echo "Removing the nct6775 kernel module..."
	sudo rm -f /etc/modules-load.d/nct6775.conf
	
	echo 'Complete, please reboot to apply changes.'
