#!/bin/bash

set -ouex pipefail

# Install Fedora packages
dnf5 -y install \
	plasma-wallpapers-dynamic \
	plasma-wallpapers-dynamic-builder
