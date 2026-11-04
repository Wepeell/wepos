#!/bin/bash

set -ouex pipefail

# Remove following error when installing packages from repos:
# gpg: Fatal: can't create directory '/root/.gnupg': No such file or directory
mkdir -p /var/roothome

# Allow packages to install files into /opt
# These files needs to be copied into an immutable part of the image
mkdir -p /var/opt

# Packages to version lock
packages=(
    qt6-qtbase
    qt6-qtdeclarative
)
# Version lock packages
dnf5 versionlock add "${packages[@]}"
