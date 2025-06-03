#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket



### Install scripts

# Run script function
function run_script() {
	local message="$1"
	local script_path="$2"
	local script_name=$(basename "$script_path")
	
	echo "$message ..."
	
	if "$script_path"; then
		echo "$script_name completed!"
	else
		echo "$script_name failed! Exiting."
		exit 1
	fi
}

# Install Fedora packages
run_script "Installing Fedora packages" "/ctx/install-fedora-pkgs.sh"

# Install COPR packages
run_script "Installing COPR packages" "/ctx/install-copr-pkgs.sh"

# Install Terra packages
run_script "Installing Terra packages" "/ctx/install-terra-pkgs.sh"

# Install Linux FCP Support Tools
run_script "Installing Linux FCP Support Tools" "/ctx/install-fcp-support.sh"

# Install Scarlett4 Firmware
run_script "Installing Scarlett4 Firmware" "/ctx/install-scarlett4-firmware.sh"

# Install ALSA Scarlett Control Panel
run_script "Installing ALSA Scarlett Control Panel" "/ctx/install-alsa-scarlett-gui.sh"

# Remove base Bazzite packages
run_script "Removing base Bazzite packages" "/ctx/remove-packages.sh"



# Clean package manager cache
dnf5 clean all
