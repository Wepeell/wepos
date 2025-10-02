# Install WepOS Global Theme
[group('Theme')]
_install-global-theme:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/theme/plasma"
	target="$HOME/.local/share"
	
	# Copy global theme files
	echo "Copying global theme files..."
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
		echo
	else
		echo "Copying failed!"
		echo
	fi

# Install dynamic wallpapers
[group('Theme')]
_install-dynamic-wallpapers:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	source="/usr/share/wepos/theme/wallpapers"
	target="$HOME/.local/share"
	
	# Copy dynamic wallpaper files
	echo "Copying dynamic wallpaper files..."
	if cp -r "$source" "$target"; then
		echo "Copying succesful!"
		echo
	else
		echo "Copying failed!"
		echo
	fi

# Setup global theme and wallpapers
[group('Theme')]
setup-theme: _install-global-theme _install-dynamic-wallpapers
