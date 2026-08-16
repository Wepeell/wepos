#!/bin/bash

set -ouex pipefail

# Repos to enable
repos=(
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
)

# Packages to install
packages=(
    deadbeef
)

# Enable repos
# dnf5 -y config-manager setopt "rpmfusion-nonfree".enabled=true
# dnf5 -y config-manager setopt "rpmfusion-free".enabled=true
# dnf5 -y config-manager setopt "*rpmfusion*".enabled=true
dnf5 -y install "${repos[@]}"

# Check if base image packages are being replaced with a dry run
dnf5 --setopt=tsflags=test -y install "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo "::notice::Detected package replacements. Aborting build."
    exit 1
fi

# Install packages
dnf5 -y install "${packages[@]}"

# Disable repos
dnf5 -y config-manager setopt "*rpmfusion*".enabled=false
