#!/bin/bash

set -ouex pipefail

# Download Scarlett4 Firmware .rpm package
wget -P "/tmp/focusrite" https://github.com/geoffreybennett/scarlett4-firmware/releases/download/2403/scarlett4-firmware-2403-1.fc38.noarch.rpm

# Install package
dnf5 install -y /tmp/focusrite/scarlett4-firmware-2403-1.fc38.noarch.rpm

# Clean up downloaded package
rm -rf /tmp/focusrite
