# Uninstall Starship
[group('Uninstall')]
uninstall-starship:
	#!/usr/bin/env bash
	set -euo pipefail

	# Variables
	target_file="${HOME}/.config/starship.toml"
	home_bashrc="${HOME}/.bashrc"
	init_script='eval "$(starship init bash)"'

	# Uninstall Starship from Homebrew
	echo "Uninstalling Starship..."
	brew uninstall starship || true
	echo

	# Remove starship.toml config
	echo "Removing starship.toml config..."
	rm -f "$target_file" || true
	echo

	# Undo configurations to .bashrc
	echo "Undoing configurations to .bashrc..."
	sed -i "/^$/ {N; /^\n${init_script}$/d}" "$home_bashrc"
	echo

	echo "Starship removed!"
	echo "Please, restart the terminal."
	echo
