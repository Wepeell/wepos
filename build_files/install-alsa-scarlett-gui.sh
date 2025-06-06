#!/bin/bash

set -ouex pipefail

# URL for download
URL="https://github.com/geoffreybennett/alsa-scarlett-gui/releases/download/0.5.1/alsa-scarlett-gui-0.5.1-1.fc41.x86_64.rpm"

# RPM filename from URL
FILENAME=$(basename "$URL")

# Target directory
TARGET_DIR="/tmp/focusrite"

# Download ALSA Scarlett Control Panel .rpm package
wget -P "$TARGET_DIR" "$URL"

# Install package
dnf5 -y install \
	"$TARGET_DIR/$FILENAME"

# Clean up downloaded package
rm -rf "$TARGET_DIR"
