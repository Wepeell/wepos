#!/bin/bash

set -ouex pipefail

# Enable Terra repo
# dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 -y config-manager setopt "terra".enabled=true

# Install fonts
dnf5 -y install firacode-nerd-fonts \
				noto-nerd-fonts

# Disable Terra repo
dnf5 -y config-manager setopt "terra*".enabled=false
