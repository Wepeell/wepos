#!/bin/bash

set -ouex pipefail

### Enable RPM Fusion Repository
# dnf5 -y config-manager setopt "rpmfusion-nonfree".enabled=true
# dnf5 -y config-manager setopt "rpmfusion-free".enabled=true
# dnf5 -y config-manager setopt "*rpmfusion*".enabled=true

### Packages array
packages=(
    borgbackup
    plasma-wallpapers-dynamic
    plasma-wallpapers-dynamic-builder
    podman-compose
    noctalia
    niri
    playerctl
)

### Check if base image packages are being replaced
# Dry run
dnf5 -y install --setopt=tsflags=test "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo "::notice::Detected package replacements. Aborting build."
    exit 1
fi

### Install packages
dnf5 -y install "${packages[@]}"
