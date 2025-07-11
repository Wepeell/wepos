#!/bin/bash

set -ouex pipefail

# Repo directory
REPO_DIR="/tmp/fcp-support"

# Install directories
BIN_DIR="/usr/bin"
SYSTEMD_DIR="/usr/lib/systemd/system"
UDEV_DIR="/usr/lib/udev/rules.d"
DATA_DIR="/usr/share/fcp-server"

# Install required packages for building
dnf5 -y install \
	make \
	gcc \
	alsa-lib-devel \
	systemd-devel \
	openssl-devel \
	zlib-devel \
	json-c-devel \
	pkgconfig

# Clone repo
git clone https://github.com/Wepeell/fcp-support.git "$REPO_DIR"

# Build
make -C "$REPO_DIR"

# Create install directories
mkdir -p "$BIN_DIR"
mkdir -p "$SYSTEMD_DIR"
mkdir -p "$UDEV_DIR"
mkdir -p "$DATA_DIR"

# Install
cp "$REPO_DIR"/fcp-server "$BIN_DIR"
cp "$REPO_DIR"/fcp-tool "$BIN_DIR"
cp "$REPO_DIR"/systemd/fcp-server@.service "$SYSTEMD_DIR"
cp "$REPO_DIR"/udev/99-fcp.rules "$UDEV_DIR"
cp "$REPO_DIR"/data/fcp-alsa-map-*.json "$DATA_DIR"

# Set permissions
chmod 755 "$BIN_DIR"/fcp-server
chmod 755 "$BIN_DIR"/fcp-tool
chmod 644 "$SYSTEMD_DIR"/fcp-server@.service
chmod 644 "$UDEV_DIR"/99-fcp.rules
chmod 644 "$DATA_DIR"/fcp-alsa-map-*.json

# Cleanup repo
rm -rf "$REPO_DIR"

# Uninstall packages for building
dnf5 -y remove \
	alsa-lib-devel \
	systemd-devel \
	json-c-devel

# Audio group membership is required to use fcp-tool
# sudo usermod -a -G audio $USER

# Reload systemd and udev
# systemctl daemon-reload
# udevadm control --reload-rules
