#!/bin/bash

set -ouex pipefail

# Add custom ujust commands
echo "import \"/usr/share/bazzite-wepeell/just/nerd-fonts.just\"" >> /usr/share/ublue-os/justfile
echo "import \"/usr/share/bazzite-wepeell/just/starship.just\"" >> /usr/share/ublue-os/justfile
