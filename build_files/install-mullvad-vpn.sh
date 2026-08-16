#!/bin/bash

set -ouex pipefail

### Links
# https://mullvad.net/en/download/vpn/linux
# https://mullvad.net/en/help/install-mullvad-app-linux

# Repofile
repofile="https://repository.mullvad.net/rpm/stable/mullvad.repo"

# Repo ID
repo_id="mullvad"

# Packages to install
packages=(
    mullvad-vpn
)

# Enable repo
dnf5 -y config-manager addrepo --from-repofile="$repofile"

# Check if base image packages are being replaced with a dry run
dnf5 --setopt=tsflags=test -y install "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo ":notice::Detected package replacements. Aborting build."
    exit 1
fi

# Install packages
dnf5 -y install "${packages[@]}"

# Disable repo
dnf5 -y config-manager setopt "*${repo_id}*".enabled=false

# Enable daemon
systemctl enable mullvad-daemon
# systemctl enable mullvad-early-boot-blocking
