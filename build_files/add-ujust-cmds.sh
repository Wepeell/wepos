#!/bin/bash

set -ouex pipefail

# Enable custom ujust commands
echo "import \"/usr/share/wepos/just/nerd-fonts.just\"" >> /usr/share/ublue-os/justfile
echo "import \"/usr/share/wepos/just/starship.just\"" >> /usr/share/ublue-os/justfile
