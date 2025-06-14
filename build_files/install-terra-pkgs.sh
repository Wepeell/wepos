#!/bin/bash

set -ouex pipefail

# Enable Terra repo
# dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 -y config-manager setopt "terra".enabled=true

### Install Terra packages

# Starship
dnf5 -y install \
	starship

# CoolerControl
dnf5 -y install \
	coolercontrold \
	coolercontrol-liqctld \
	coolercontrol

# Disable Terra repo
dnf5 -y config-manager setopt "terra*".enabled=false

# Enable CoolerControl daemon
systemctl enable coolercontrold
