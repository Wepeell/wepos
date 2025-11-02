#!/bin/bash

set -ouex pipefail

# Enable RPM Fusion Repository
# dnf5 -y config-manager setopt "rpmfusion-nonfree".enabled=true
# dnf5 -y config-manager setopt "rpmfusion-free".enabled=true
# dnf5 -y config-manager setopt "*rpmfusion*".enabled=true

# Packages array
packages=(
	borgbackup

	### Pin version 5.0.0-7.fc43
	# Version 5.0.0-10.fc43 replaces 100 packages for some reason
	# Unpin when it gets fixed upstream
	plasma-wallpapers-dynamic-5.0.0-7.fc43
	plasma-wallpapers-dynamic-builder-5.0.0-7.fc43
)

# Check if base image packages are being replaced
if dnf5 install --setopt=tsflags=test -y "${packages[@]}" | grep -E '^(Upgrading|Downgrading):'; then
	echo "Detected package replacements. Aborting build."
	exit 1
fi

# Install Fedora packages from array
dnf5 -y install "${packages[@]}"
