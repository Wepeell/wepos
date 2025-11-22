#!/bin/bash

set -ouex pipefail

### Variables

# Axe-Fx 2 USB firmware
firmware_source="/ctx/repo_files/axefx2-usb-firmware"
firmware_target="/usr/share/usb/FractalAudio/axefx2"
firmware_bin="axefx2load.hex"

# udev rules
udev_dir="/etc/udev/rules.d"
udev_file="99-fractalaudio.rules"
# fxload_path="$(which fxload)"
fxload_path="/usr/bin/fxload"

### Install required packages
# dnf5 -y install \
#	fxload

### Install USB firmware binary

# Create directory
mkdir -p "$firmware_target"

# Set permissions for both "FractalAudio" and "axefx2" directories
chmod 755 "$firmware_target" \
	"${firmware_target%/*}"

# Copy binary
cp "${firmware_source}/${firmware_bin}" "${firmware_target}/${firmware_bin}"

# Set binary permissions
chmod 644 "${firmware_target}/${firmware_bin}"

### Install udev rule

# Create directory
mkdir -p "$udev_dir"

# Create udev rules file
cat <<EOF > "${udev_dir}/${udev_file}"
### fractalaudio.rules - udev rules for uploading USB firmware to Fractal Audio Systems devices

# Fractal Audio Systems Axe-FX II
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2466", ATTR{idProduct}=="0003", RUN+="'$fxload_path' -t fx2lp -I '${firmware_target}/${firmware_bin}' -D \$env{DEVNAME}"
EOF

### Important notes
# There is a regression in Wine around version 7.2
# https://bugs.winehq.org/show_bug.cgi?id=56961

# When installing Axe-Edit for Axe-Fx 2 use any of these Wine versions/runners:
# lutris-6.21-6
# kron4ek-wine-10.18-amd64
# kron4ek-wine-10.19-amd64

# There are regressions in newer versions of Fractal-Bot
# https://forum.fractalaudio.com/threads/axe-fx-ii-users-on-linux-use-fractal-bot-v3p00p03.203669/

# When installing Fractal-Bot use version:
# Fractal-Bot-Win-v3p00p03.exe

# If using Bottles turn off DXVK and VKD3D to prevent Axe-Edit from crashing
