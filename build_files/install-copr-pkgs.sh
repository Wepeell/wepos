#!/bin/bash

set -ouex pipefail

### Repos array
repos=(
    codifryed/CoolerControl
    atim/starship
    faugus/faugus-launcher
)

### Packages array
packages=(
    ### CoolerControl
    coolercontrold
    coolercontrol
    liquidctl
    ###
    starship
    faugus-launcher
)

### Enable repos
for repo in "${repos[@]}"; do
    dnf5 -y copr enable "$repo"
done

### Check if base image packages are being replaced
# Dry run
dnf5 -y install --setopt=tsflags=test "${packages[@]}" 2>&1 | tee /tmp/dryrun.log

# Check log for upgrading and downgrading
if grep -qE '^(Upgrading|Downgrading):' /tmp/dryrun.log; then
    echo ":notice::Detected package replacements. Aborting build."
    exit 1
fi

### Install packages
dnf5 -y install "${packages[@]}"

### Disable repos
for repo in "${repos[@]}"; do
    dnf5 -y copr disable "$repo"
done

### CoolerControl
# Enable daemon
systemctl enable coolercontrold

### Starship
# Insert into bashrc without expanding $(...)
cat <<'EOF' >> "/etc/bashrc"

# Check if Starship is installed
if command -v starship &>/dev/null; then
    # Enable Starship shell prompt
    eval "$(starship init bash)"
fi
EOF
