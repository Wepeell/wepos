#!/bin/bash

set -ouex pipefail

### Target directories

# Scarlett4 Firmware
firmware_dir="/ctx/repo_files/scarlett4-firmware"

# ALSA Scarlett Control Panel
gui_dir="/ctx/repo_files/alsa-scarlett-gui"

# Install packages
dnf5 -y install \
	"${firmware_dir}"/* \
	"${gui_dir}"/*
