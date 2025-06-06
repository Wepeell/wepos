#!/bin/bash

set -ouex pipefail

# URL for download
URL="https://github.com/geoffreybennett/scarlett4-firmware/releases/download/2403/scarlett4-firmware-2403-1.fc38.noarch.rpm"

# RPM filename from URL
FILENAME=$(basename "$URL")

# Target directory
TARGET_DIR="/tmp/focusrite"

# Download Scarlett4 Firmware .rpm package
wget -P "$TARGET_DIR" "$URL"

# Install package
dnf5 -y install \
	"$TARGET_DIR/$FILENAME"

# Clean up downloaded package
rm -rf "$TARGET_DIR"
