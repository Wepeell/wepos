# Install custom keyboard layouts
[group('Install')]
install-keyboard-layouts:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/keyboard-layouts/xkb"
	target="$HOME/.config"
	
	# Copy keyboard layout files
	echo "Copying keyboard layout files..."
	
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
	else
		echo "Copying failed!"
	fi
