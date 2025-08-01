#!/bin/bash

set -ouex pipefail

### CoolerControl

# Enable COPR repo
dnf5 -y copr enable codifryed/CoolerControl

# Install COPR packages
dnf5 -y install \
	coolercontrold \
	coolercontrol-liqctld \
	coolercontrol

# Enable daemon
systemctl enable coolercontrold

# Load the nct6775 kernel module for ASUS ROG Strix B650E-F Gaming Wifi
# https://github.com/lm-sensors/lm-sensors/issues/416#issuecomment-2359409670
# sudo modprobe nct6775

# Load the nct6775 kernel module after every reboot
mkdir -p /etc/modules-load.d
echo "nct6775" | tee /etc/modules-load.d/nct6775.conf

# Add kernel argument to enable full AMD GPU functionality
mkdir -p /usr/lib/bootc/kargs.d
cat <<EOF > /usr/lib/bootc/kargs.d/99-amdgpu.toml
kargs = ["amdgpu.ppfeaturemask=0xffffffff"]
EOF

# If above doesn't work, run this manually on live system to add karg
# rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff

# Revert karg
# rpm-ostree kargs --delete=amdgpu.ppfeaturemask=0xffffffff

# Disable COPR repo
dnf5 -y copr disable codifryed/CoolerControl
