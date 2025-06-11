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

# Run script function
function run_script() {
	local script="$1"
	
	echo "Running $script..."
	
	if "$script"; then
		echo "$script completed!"
	else
		echo "$script failed! Exiting."
		exit 1
	fi
}

# Copy system_files to base image
cp -r /ctx/system_files/* /

# Remove error when installing packages from repos:
# gpg: Fatal: can't create directory '/root/.gnupg': No such file or directory
mkdir -p /var/roothome

# Install Fedora packages
run_script "/ctx/install-fedora-pkgs.sh"

# Install COPR packages
# run_script "/ctx/install-copr-pkgs.sh"

# Install Terra packages
# run_script "/ctx/install-terra-pkgs.sh"

# Install Linux FCP Support Tools
run_script "/ctx/install-fcp-support.sh"

# Install Scarlett4 Firmware
run_script "/ctx/install-scarlett4-firmware.sh"

# Install ALSA Scarlett Control Panel
run_script "/ctx/install-alsa-scarlett-gui.sh"

# Remove base Bazzite packages
# run_script "/ctx/remove-bazzite-pkgs.sh"



# Remove autostart files
rm -f /etc/skel/.config/autostart/steam.desktop

# Clean package manager cache
dnf5 clean all
