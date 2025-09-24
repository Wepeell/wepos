#!/bin/bash

set -ouex pipefail

### Variables

# Axe-Fx 2 USB firmware
FIRMWARE_SOURCE="/ctx/repo_files/axefx2-usb-firmware"
FIRMWARE_TARGET="/usr/share/usb/FractalAudio/axefx2"
FIRMWARE_BIN="axefx2load.hex"

# udev rules
UDEV_DIR="/etc/udev/rules.d"
UDEV_FILE="99-fractalaudio.rules"
# FXLOAD_PATH="$(which fxload)"
FXLOAD_PATH="/usr/bin/fxload"

### Install required packages
# dnf5 -y install \
#	fxload

### Install USB firmware binary

# Create directory
mkdir -p "$FIRMWARE_TARGET"

# Set permissions for both "FractalAudio" and "axefx2" directories
chmod 755 "$FIRMWARE_TARGET" \
	"${FIRMWARE_TARGET%/*}"

# Copy binary
cp "$FIRMWARE_SOURCE/$FIRMWARE_BIN" "$FIRMWARE_TARGET/$FIRMWARE_BIN"

# Set binary permissions
chmod 644 "$FIRMWARE_TARGET/$FIRMWARE_BIN"

### Install udev rule

# Create directory
mkdir -p "$UDEV_DIR"

# Create udev rules file
cat <<EOF > "$UDEV_DIR/$UDEV_FILE"
### fractalaudio.rules - udev rules for uploading USB firmware to Fractal Audio Systems devices

# Fractal Audio Systems Axe-FX II
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2466", ATTR{idProduct}=="0003", RUN+="'$FXLOAD_PATH' -t fx2lp -I '$FIRMWARE_TARGET/$FIRMWARE_BIN' -D \$env{DEVNAME}"
EOF
