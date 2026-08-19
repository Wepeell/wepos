#!/bin/bash

set -ouex pipefail

# Clean package manager cache
dnf5 clean all

# Copy the contents of system_files/ of the git repo to /
cp -rv "/ctx/system_files"/. /

# Remove autostart files
rm -f /etc/skel/.config/autostart/steam.desktop

# Disable autostart
tee -a "/etc/xdg/autostart/org.kde.xwaylandvideobridge.desktop" <<'EOF'
Hidden=true
EOF

### Add kargs
# tee "/usr/lib/bootc/kargs.d/99-amd.toml" <<'EOF'
# kargs = ["amdgpu.ppfeaturemask=0xffffffff"]
# EOF
