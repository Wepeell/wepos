#!/bin/bash

set -ouex pipefail

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
git clone https://github.com/geoffreybennett/fcp-support.git /tmp/fcp-support

# Build
make -C /tmp/fcp-support

# Install
mkdir -p /usr/bin
mkdir -p /usr/lib/systemd/system
mkdir -p /usr/lib/udev/rules.d
mkdir -p /usr/share/fcp-server

cp /tmp/fcp-support/fcp-server /usr/bin
cp /tmp/fcp-support/fcp-tool /usr/bin
cp /tmp/fcp-support/systemd/fcp-server@.service /usr/lib/systemd/system
cp /tmp/fcp-support/udev/99-fcp.rules /usr/lib/udev/rules.d
cp /tmp/fcp-support/data/fcp-alsa-map-*.json /usr/share/fcp-server

# Set permissions
chmod 755 /usr/bin/fcp-server
chmod 755 /usr/bin/fcp-tool
chmod 644 /usr/lib/systemd/system/fcp-server@.service
chmod 644 /usr/lib/udev/rules.d/99-fcp.rules
chmod 644 /usr/share/fcp-server/fcp-alsa-map-*.json

# Cleanup repo
rm -rf /tmp/fcp-support

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
