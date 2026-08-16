#!/bin/bash

set -ouex pipefail

# Packages to install
packages=(
    /ctx/repo_files/fcp-support/*
    /ctx/repo_files/scarlett4-firmware/*
    /ctx/repo_files/alsa-scarlett-gui/*
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
