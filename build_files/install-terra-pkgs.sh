#!/bin/bash

set -ouex pipefail

# Enable Terra repo
# dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 -y config-manager setopt "terra".enabled=true

# Install Terra packages
# dnf5 -y install \
	# package-name

# Disable Terra repo
dnf5 -y config-manager setopt "terra*".enabled=false
