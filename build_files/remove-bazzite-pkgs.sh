#!/bin/bash

set -ouex pipefail

# Remove Lutris
dnf5 remove -y lutris

# Remove Steam but keep dependencies
dnf5 remove -y --noautoremove steam

# Clean up .desktop shortcuts
rm -f /usr/share/applications/bazzite-steam-bpm.desktop
