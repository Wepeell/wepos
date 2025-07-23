#!/bin/bash

set -ouex pipefail

# Target directory
FIRMWARE_DIR="/ctx/repo_files/scarlett4-firmware"
GUI_DIR="/ctx/repo_files/alsa-scarlett-gui"

# Install package
dnf5 -y install \
	"$FIRMWARE_DIR"/* \
	"$GUI_DIR"/*

