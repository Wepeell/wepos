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

# Disable COPR repo
dnf5 -y copr disable codifryed/CoolerControl
