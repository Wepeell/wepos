#!/bin/bash

set -ouex pipefail

# Remove Lutris
dnf5 -y remove \
	lutris

# Remove Steam but keep dependencies
dnf5 -y remove --noautoremove \
	steam

# Clean up .desktop shortcuts
rm -f /usr/share/applications/bazzite-steam-bpm.desktop
