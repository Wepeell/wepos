#!/bin/bash

set -ouex pipefail

# Install required packages for building
dnf5 install -y plasma-wallpapers-dynamic \
				plasma-wallpapers-dynamic-builder
