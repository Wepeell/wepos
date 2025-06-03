#!/bin/bash

set -ouex pipefail

# Download ALSA Scarlett Control Panel .rpm package
wget -P "/tmp/focusrite" https://github.com/geoffreybennett/alsa-scarlett-gui/releases/download/0.5.1/alsa-scarlett-gui-0.5.1-1.fc41.x86_64.rpm

# Install package
dnf5 install -y /tmp/focusrite/alsa-scarlett-gui-0.5.1-1.fc41.x86_64.rpm

# Clean up downloaded package
rm -rf /tmp/focusrite
