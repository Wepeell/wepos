#!/bin/bash

set -ouex pipefail

### Starship

# Enable COPR repo
# dnf5 -y copr enable atim/starship

# Install COPR packages
# dnf5 -y install \
	# starship

# Disable COPR repo
# dnf5 -y copr disable atim/starship



### CoolerControl

# Enable COPR repo
dnf5 -y copr enable codifryed/CoolerControl

# Install COPR packages
dnf5 -y install \
	coolercontrold \
	coolercontrol-liqctld \
	coolercontrol

# Disable COPR repo
dnf5 -y copr disable codifryed/CoolerControl

# Enable daemon
systemctl enable coolercontrold
