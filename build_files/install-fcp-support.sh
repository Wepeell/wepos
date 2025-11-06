#!/bin/bash

set -ouex pipefail

# Repo directory
repo_dir="/tmp/fcp-support"

# Directory prefix
prefix_dir="/usr"

# Packages array
packages=(
	# make
	# gcc
	alsa-lib-devel
	systemd-devel
	# openssl-devel
	# zlib-devel
	json-c-devel
	# pkgconfig
)

# Check if base image packages are being replaced
if dnf5 install --setopt=tsflags=test -y "${packages[@]}" | grep -E '^(Upgrading|Downgrading):'; then
	echo "Detected package replacements. Aborting build."
	exit 1
fi

# Install required packages for building from array
dnf5 -y install "${packages[@]}"

# Clone repo
git clone https://github.com/Wepeell/fcp-support.git "${repo_dir}"

# Build
make \
	-C "${repo_dir}" \
	PREFIX=${prefix_dir}

# Install
make install \
	-C "${repo_dir}" \
	PREFIX=${prefix_dir}

# Cleanup repo
rm -rf "${repo_dir}"

# Uninstall packages for building from array
dnf5 -y remove "${packages[@]}"

# Audio group membership is required to use fcp-tool
# sudo usermod -a -G audio $USER

# Reload systemd and udev
# systemctl daemon-reload
# udevadm control --reload-rules
