# just variables
filename := "starship.toml"
source_dir := "/usr/share/wepos/starship"
target_dir := "$HOME/.config"
source_file := source_dir + "/" + filename
target_file := target_dir + "/" + filename
home_bashrc := "$HOME/.bashrc"
init_script := 'eval "$(starship init bash)"'

# Uninstall Starship
[group('Uninstall')]
uninstall-starship:
	#!/usr/bin/env bash
	set -euo pipefail

	# Shell variables
	target_file="{{target_file}}"
	home_bashrc="{{home_bashrc}}"
	init_script='{{init_script}}'

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
	sed -i "/^$/ {N; /^\n$init_script$/d}" "$home_bashrc"
	echo

	echo "Starship removed!"
	echo "Please, restart the terminal."
	echo
