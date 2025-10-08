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
	target="$HOME/.local/share"
	
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
