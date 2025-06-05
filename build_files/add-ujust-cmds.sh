#!/bin/bash

set -ouex pipefail

# Copy just files to base image
cp /ctx/system_files/usr/share/bazzite-wepeell/just/*.just /usr/share/bazzite-wepeell/just

# Enable custom ujust commands
echo "import \"/usr/share/bazzite-wepeell/just/nerd-fonts.just\"" >> /usr/share/ublue-os/justfile
echo "import \"/usr/share/bazzite-wepeell/just/starship.just\"" >> /usr/share/ublue-os/justfile
