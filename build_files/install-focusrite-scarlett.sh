#!/bin/bash

set -ouex pipefail

### Packages array
# Target directories as elements
packages=(
	/ctx/repo_files/fcp-support/*
	/ctx/repo_files/scarlett4-firmware/*
	/ctx/repo_files/alsa-scarlett-gui/*
)

### Install packages
dnf5 -y install "${packages[@]}"
