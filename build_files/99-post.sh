#!/bin/bash

set -ouex pipefail

# Clean package manager cache
dnf5 clean all

# Copy system_files to base image
cp -r /ctx/system_files/* /

# Remove autostart files
rm -f /etc/skel/.config/autostart/steam.desktop

# Copy /opt content into an immutable part of the image
# These files needs to be copied or symlinked back into /var/opt on the running system to be used
cp -r /var/opt/. /usr/share/wepos/opt/

# Enable Mullvad VPN repo for local layering
# rpm-ostree install mullvad-vpn
dnf5 -y config-manager addrepo --from-repofile="https://repository.mullvad.net/rpm/stable/mullvad.repo"

### Add kargs
# cat <<'EOF' > "/usr/lib/bootc/kargs.d/99-amd.toml"
# kargs = ["amdgpu.ppfeaturemask=0xffffffff"]
# EOF
