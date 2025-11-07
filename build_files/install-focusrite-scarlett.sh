#!/bin/bash

set -ouex pipefail

### Target directories

# Linux FCP Support Tools
fcp_dir="/ctx/repo_files/fcp-support"

# Scarlett4 Firmware
firmware_dir="/ctx/repo_files/scarlett4-firmware"

# ALSA Scarlett Control Panel
gui_dir="/ctx/repo_files/alsa-scarlett-gui"

# Install packages
dnf5 -y install \
	"${fcp_dir}"/* \
	"${firmware_dir}"/* \
	"${gui_dir}"/*
