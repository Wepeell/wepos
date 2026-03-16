#!/bin/bash

set -ouex pipefail

### Links
# https://mullvad.net/en/download/vpn/linux
# https://mullvad.net/en/help/install-mullvad-app-linux

### Repo file URL
repo_file_url="https://repository.mullvad.net/rpm/stable/mullvad.repo"

### Repo ID
repo_id="mullvad"

### Package name
package_name="mullvad-vpn"

### Enable repo
dnf5 -y config-manager addrepo --from-repofile="$repo_file_url"

### Check if base image packages are being replaced
# Dry run
dnf5 -y install --setopt=tsflags=test "$package_name" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
	echo ":notice::Detected package replacements. Aborting build."
	exit 1
fi

### Install package
dnf5 -y install "$package_name"

### Disable repo
dnf5 -y config-manager setopt "*${repo_id}*".enabled=false

### Enable daemon
systemctl enable mullvad-daemon
# systemctl enable mullvad-early-boot-blocking
