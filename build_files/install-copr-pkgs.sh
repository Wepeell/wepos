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

# Load the module after every reboot
echo "nct6775" | tee /etc/modules-load.d/nct6775.conf

# Disable COPR repo
dnf5 -y copr disable codifryed/CoolerControl
