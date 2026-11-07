#!/bin/bash

set -ouex pipefail

# Packages to install
packages=(
    borgbackup
    micro
    niri
    noctalia
    plasma-wallpapers-dynamic
    plasma-wallpapers-dynamic-builder
    playerctl
    podman-compose
    slurp
    xdg-desktop-portal-gnome
)

# Check if base image packages are being replaced with a dry run
dnf5 --setopt=tsflags=test -y install "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo "::notice::Detected package replacements. Aborting build."
    exit 1
fi

# Install packages
dnf5 -y install "${packages[@]}"

# Replace VIM with Micro as text default editor
sed -i 's/^EDITOR=/# EDITOR=/' /etc/environment
tee -a "/etc/environment" <<'EOF'

# Use Micro as default text editor
EDITOR=/usr/bin/micro
EOF
