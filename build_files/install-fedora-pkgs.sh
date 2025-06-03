#!/bin/bash

set -ouex pipefail

# Install Fedora packages
dnf5 install -y plasma-wallpapers-dynamic \
				plasma-wallpapers-dynamic-builder
