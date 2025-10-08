# Install WepOS Global Theme
[group('Theme')]
_install-global-theme:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/theme/plasma"
	target="${HOME}/.local/share"
	
	# Copy global theme files
	echo "Copying global theme files..."
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
	else
		echo "Copying failed!"
	fi

# Install dynamic wallpapers
[group('Theme')]
_install-dynamic-wallpapers:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/theme/wallpapers"
	target="${HOME}/.local/share"
	
	# Copy dynamic wallpaper files
	echo "Copying dynamic wallpaper files..."
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
	else
		echo "Copying failed!"
	fi

# Setup global theme and wallpapers
[group('Theme')]
setup-theme:
	@just _install-global-theme
	@echo
	@just _install-dynamic-wallpapers

# Copy global theme into home directory
[group('Theme')]
copy-theme:
	#!/usr/bin/env bash
	set -euo pipefail

	# Define source-target pairs in an associative array
	declare -A paths=(
		["/usr/share/plasma/layout-templates/com.github.wepos.desktop.defaultPanel"]="${HOME}/.local/share/plasma/layout-templates/"
		["/usr/share/plasma/look-and-feel/com.github.wepos.desktop"]="${HOME}/.local/share/plasma/look-and-feel/"
	)

	# Loop count variables
	count=0
	total=${#paths[@]}

	# Set "$source" variable to associative array key
	for source in "${!paths[@]}"; do
		# Set "$target" variable to associative array value
		target="${paths[$source]}"

		# Create target directory
		mkdir -p "$target"

		# Copy files
		echo "Copying \"$(basename "$source")\" to \"$(basename "$target")...\""
		if cp -r "$source" "$target"; then
			echo "Copying succesful!"
		else
			echo "Copying failed!"
		fi

		# Echo except on last iteration
		if (( ++count < total)); then
			echo
		fi
	done
