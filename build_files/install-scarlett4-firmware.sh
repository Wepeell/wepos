#!/bin/bash

set -ouex pipefail

# Download Scarlett4 Firmware .rpm package
wget -P "/tmp" https://github.com/geoffreybennett/scarlett4-firmware/releases/download/2403/scarlett4-firmware-2403-1.fc38.noarch.rpm

# Install package
dnf5 install -y /tmp/scarlett4-firmware-2403-1.fc38.noarch.rpm

# Clean up downloaded package
rm -f /tmp/scarlett4-firmware-2403-1.fc38.noarch.rpm
