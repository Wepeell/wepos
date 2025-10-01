# Install custom keyboard layouts
[group('Keyboard')]
_install-keyboard-layouts:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/keyboard-layouts/xkb"
	target="${HOME}/.config"
	
	# Copy keyboard layout files into user $HOME
	echo "Copying keyboard layout files into ${target} ..."
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
		echo
	else
		echo "Copying failed!"
		echo
	fi
