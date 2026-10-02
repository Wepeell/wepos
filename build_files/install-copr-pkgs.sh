#!/bin/bash

set -ouex pipefail

# Repos to enable
repos=(
    codifryed/CoolerControl
    errornointernet/packages
    faugus/faugus-launcher
    ulysg/xwayland-satellite # Revert me
)

# Packages to install
packages=(
    coolercontrol
    coolercontrold
    liquidctl # CoolerControl dependency
    faugus-launcher
    wl-screenrec
)

# Enable repos
for repo in "${repos[@]}"; do
    dnf5 -y copr enable "$repo"
done

# Check if base image packages are being replaced with a dry run
dnf5 --setopt=tsflags=test -y install "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo ":notice::Detected package replacements. Aborting build."
    exit 1
fi

# Install packages
dnf5 -y install "${packages[@]}"

# Revert me: upgrade xwayland-satellite
dnf5 -y upgrade --from-repo "copr:copr.fedorainfracloud.org:ulysg:xwayland-satellite" "xwayland-satellite"

# Disable repos
for repo in "${repos[@]}"; do
    dnf5 -y copr disable "$repo"
done

### CoolerControl
# Enable daemon
systemctl enable coolercontrold
