#!/bin/bash

set -ouex pipefail

# Clean package manager cache
dnf5 clean all

# Copy system_files to base image
cp -r /ctx/system_files/* /

# Remove autostart files
rm -f /etc/skel/.config/autostart/steam.desktop

# Enable Mullvad VPN repo for local layering
dnf5 -y config-manager addrepo --from-repofile="https://repository.mullvad.net/rpm/stable/mullvad.repo"

### Add kargs
# cat <<'EOF' > "/usr/lib/bootc/kargs.d/99-amd.toml"
# kargs = ["amdgpu.ppfeaturemask=0xffffffff"]
# EOF
