#!/bin/bash

set -ouex pipefail

# Repos array
repos=(
	codifryed/CoolerControl
	atim/starship
)

# Packages array
packages=(
	### CoolerControl
	coolercontrold
	coolercontrol
	# liquidctl
	python3-liquidctl
	###

	starship
)

# Enable COPR repos
for repo in "${repos[@]}"; do
	dnf5 -y copr enable "$repo"
done

# Install COPR packages
dnf5 -y install "${packages[@]}"

# Disable COPR repos
for repo in "${repos[@]}"; do
	dnf5 -y copr disable "$repo"
done

# CoolerControl
# Enable daemon
systemctl enable coolercontrold

# Starship
# Insert into bashrc without expanding $(...)
cat <<'EOF' >> "/etc/bashrc"

# Enable Starship shell prompt
eval "$(starship init bash)"
EOF
