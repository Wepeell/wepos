#!/bin/bash

set -ouex pipefail

# Repo directory
repo_dir="/tmp/fcp-support"

# Install directories
bin_dir="/usr/bin"
systemd_dir="/usr/lib/systemd/system"
udev_dir="/usr/lib/udev/rules.d"
data_dir="/usr/share/fcp-server"

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
make -C "$repo_dir"

# Create install directories
mkdir -p "$bin_dir"
mkdir -p "$systemd_dir"
mkdir -p "$udev_dir"
mkdir -p "$data_dir"

# Install
cp "${repo_dir}/fcp-server" "$bin_dir"
cp "${repo_dir}/fcp-tool" "$bin_dir"
cp "${repo_dir}/systemd/fcp-server@.service" "$systemd_dir"
cp "${repo_dir}/udev/99-fcp.rules" "$udev_dir"
cp "${repo_dir}/data"/fcp-alsa-map-*.json "$data_dir"

# Set permissions
chmod 755 "${bin_dir}/fcp-server"
chmod 755 "${bin_dir}/fcp-tool"
chmod 644 "${systemd_dir}/fcp-server@.service"
chmod 644 "${udev_dir}/99-fcp.rules"
chmod 644 "${data_dir}"/fcp-alsa-map-*.json

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
