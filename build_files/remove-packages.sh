#!/bin/bash

set -ouex pipefail

# Remove base Bazzite packages
dnf5 remove -y lutris \
			   # steam

# Clean up .desktop shortcuts
# rm -f /usr/share/applications/bazzite-steam-bpm.desktop
