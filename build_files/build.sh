#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket



### Install scripts

# Install packages
echo "Installing packages..."
if /ctx/install-packages.sh; then
	echo "Packages installed!"
else
	echo "install-packages.sh failed! Exiting."
	exit 1
fi



# Install Starship Shell Prompt
# echo "Installing Starship Shell Prompt..."
# if /ctx/install-starship.sh; then
# 	echo "Starship Shell Prompt installed!"
# else
# 	echo "install-starship.sh failed! Exiting."
# 	exit 1
# fi



# Install Linux FCP (Focusrite Control Protocol) Support Tools
echo "Installing Linux FCP (Focusrite Control Protocol) Support Tools..."
if /ctx/install-fcp-support.sh; then
	echo "Linux FCP Support Tools installed!"
else
	echo "install-fcp-support.sh failed! Exiting."
	exit 1
fi



# Remove base Bazzite packages
# echo "Removing base Bazzite packages..."
# if /ctx/remove-packages.sh; then
# 	echo "Base Bazzite packages removed!"
# else
# 	echo "remove-packages.sh failed! Exiting."
# 	exit 1
# fi



# Clean package manager cache
dnf5 clean all
