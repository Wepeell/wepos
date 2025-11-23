# List existing Distrobox containers
[group('Distrobox')]
distrobox-list:
	distrobox list

# Alias for distrobox-list
alias distrobox := distrobox-list

# Create a Distrobox container, requires one argument for its name
[group('Distrobox')]
distrobox-create container_name:
	#!/usr/bin/env bash
	set -euo pipefail

	# Variables
	container_image="ghcr.io/ublue-os/fedora-toolbox:latest"
	container_name="{{container_name}}"
	container_home="${HOME}/distrobox/${container_name}"

	# Create distrobox
	distrobox create \
		--image "$container_image" \
		--name "$container_name" \
		--home "$container_home"

# Clone a Distrobox container, requires one argument for which container to clone
[group('Distrobox')]
distrobox-clone container_name:
	#!/usr/bin/env bash
	set -euo pipefail

	# Variables
	container_name="{{container_name}}"
	clone_name="${container_name}_clone"
	clone_home="${HOME}/distrobox/${clone_name}"

	# Create distrobox
	distrobox create \
		--clone "$container_name" \
		--name "$clone_name" \
		--home "$clone_home"

# Delete a Distrobox container, requires one argument for which container to delete
[group('Distrobox')]
distrobox-rm container_name:
	#!/usr/bin/env bash
	set -euo pipefail

	# Variables
	container_name="{{container_name}}"

	# Delete distrobox
	distrobox rm "${container_name}"
