#!/bin/bash

set -ouex pipefail

# Repos to enable
repos=(
    atim/starship
    codifryed/CoolerControl
    faugus/faugus-launcher
)

# Packages to install
packages=(
    coolercontrol
    coolercontrold
    liquidctl # CoolerControl dependency
    faugus-launcher
    starship
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

# Disable repos
for repo in "${repos[@]}"; do
    dnf5 -y copr disable "$repo"
done

### CoolerControl
# Enable daemon
systemctl enable coolercontrold

### Starship
# Insert into bashrc without expanding $(...)
tee -a "/etc/bashrc" <<'EOF'

# Check if Starship is installed
if command -v starship &>/dev/null; then
    # Enable Starship shell prompt
    eval "$(starship init bash)"
fi
EOF
