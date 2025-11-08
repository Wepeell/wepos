#!/bin/bash

set -ouex pipefail

# Remove following error when installing packages from repos:
# gpg: Fatal: can't create directory '/root/.gnupg': No such file or directory
mkdir -p /var/roothome

# Disable Terra repo
dnf5 -y config-manager setopt "terra*".enabled=false
