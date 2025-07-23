#!/bin/bash

set -ouex pipefail

### Target directories

# Scarlett4 Firmware
FIRMWARE_DIR="/ctx/repo_files/scarlett4-firmware"

# ALSA Scarlett Control Panel
GUI_DIR="/ctx/repo_files/alsa-scarlett-gui"

# Install packages
dnf5 -y install \
	"$FIRMWARE_DIR"/* \
	"$GUI_DIR"/*

