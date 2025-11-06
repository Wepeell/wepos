#!/bin/bash

set -ouex pipefail

# Repo directory
repo_dir="/tmp/fcp-support"

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
git clone https://github.com/Wepeell/fcp-support.git "$repo_dir"

# Build
make \
	-C "$repo_dir" \
	PREFIX=/usr

# Install
make install \
	-C "$repo_dir" \
	PREFIX=/usr

# Cleanup repo
rm -rf "$repo_dir"

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
