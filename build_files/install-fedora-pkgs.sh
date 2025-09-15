#!/bin/bash

set -ouex pipefail

# Enable RPM Fusion Repository
# dnf5 -y config-manager setopt "rpmfusion-nonfree".enabled=true
# dnf5 -y config-manager setopt "rpmfusion-free".enabled=true
# dnf5 -y config-manager setopt "*rpmfusion*".enabled=true

# Install Fedora packages
dnf5 -y install \
	plasma-wallpapers-dynamic \
	plasma-wallpapers-dynamic-builder
