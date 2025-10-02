#!/bin/bash

set -ouex pipefail

# Enable RPM Fusion Repository
# dnf5 -y config-manager setopt "rpmfusion-nonfree".enabled=true
# dnf5 -y config-manager setopt "rpmfusion-free".enabled=true
# dnf5 -y config-manager setopt "*rpmfusion*".enabled=true

# Packages array
packages=(
	plasma-wallpapers-dynamic
	plasma-wallpapers-dynamic-builder
)

# Install Fedora packages from array
dnf5 -y install "${packages[@]}"
