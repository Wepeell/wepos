#!/bin/bash

set -ouex pipefail

### Links
# https://mullvad.net/en/download/vpn/linux
# https://mullvad.net/en/help/install-mullvad-app-linux

### Repos array
repos=(
	https://repository.mullvad.net/rpm/stable/mullvad.repo
)

### Packages array
packages=(
	mullvad-vpn
)

### Enable repos
for repo in "${repos[@]}"; do
	dnf5 -y config-manager addrepo --from-repofile="$repo"
done

### Check if base image packages are being replaced
# Dry run
dnf5 install --setopt=tsflags=test -y "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
	echo ":notice::Detected package replacements. Aborting build."
	exit 1
fi

### Install packages
dnf5 -y install "${packages[@]}"

### Disable repos
for repo in "${repos[@]}"; do
	repo_id=$(basename "$repo" .repo)
	dnf5 -y config-manager setopt "$repo_id*".enabled=false
done

### Enable daemon
systemctl enable mullvad-daemon
# systemctl enable mullvad-early-boot-blocking
