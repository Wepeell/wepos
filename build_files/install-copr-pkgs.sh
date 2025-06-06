#!/bin/bash

set -ouex pipefail

# Enable COPR repo
dnf5 -y copr enable atim/starship

# Install COPR packages
dnf5 -y install \
	starship

# Disable COPR repo
dnf5 -y copr disable atim/starship
