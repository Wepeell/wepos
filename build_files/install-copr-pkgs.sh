#!/bin/bash

set -ouex pipefail

# Repos array
repos=(
	codifryed/CoolerControl
)

# Packages array
packages=(
	coolercontrold
	coolercontrol-liqctld
	coolercontrol
)

# Enable COPR repos
for repo in "${repos[@]}"; do
	dnf5 -y copr enable "$repo"
done

# Install COPR packages
dnf5 -y install "${packages[@]}"

# Disable COPR repos
for repo in "${repos[@]}"; do
	dnf5 -y copr disable "$repo"
done

# CoolerControl
# Enable daemon
systemctl enable coolercontrold
