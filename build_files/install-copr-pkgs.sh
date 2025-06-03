#!/bin/bash

set -ouex pipefail

# Enable COPR repo
dnf5 -y copr enable atim/starship

# Install Starship package
dnf5 install -y starship

# Disable COPR repo
dnf5 -y copr disable atim/starship

# Configure bashrc
bashrc_file="/etc/skel/.bashrc"
echo >> "$bashrc_file"
echo '# Enable Starship Shell Prompt' >> "$bashrc_file"
echo 'eval "$(starship init bash)"' >> "$bashrc_file"

# Download starship.toml
toml_dir="/etc/skel/.config"
wget -P "$toml_dir" https://raw.githubusercontent.com/ublue-os/aurora/refs/heads/main/system_files/shared/etc/skel/.config/starship.toml
