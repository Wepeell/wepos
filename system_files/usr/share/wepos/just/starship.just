# just variables
filename := "starship.toml"
source_dir := "/usr/share/wepos/starship"
target_dir := "$HOME/.config"
source_file := source_dir + "/" + filename
target_file := target_dir + "/" + filename
home_bashrc := "$HOME/.bashrc"
init_script := 'eval "$(starship init bash)"'

# Install Starship and Aurora config
[group('Install')]
install-starship:
	#!/usr/bin/env bash
	set -euo pipefail

	# Variables
	source_dir="/usr/share/wepos/starship"
	target_dir="${HOME}/.config"
	filename="starship.toml"

	source_file="${source_dir}/${filename}"
	target_file="${target_dir}/${filename}"

	home_bashrc="${HOME}/.bashrc"
	init_script='eval "$(starship init bash)"'

	# Install Starship with Homebrew
	echo "Installing Starship with Homebrew..."
	echo
	brew install starship
	echo

	# Copy Aurora starship.toml config
	echo "Copying Aurora ${filename} config into ${target_dir} ..."
	if cp "$source_file" "$target_file"; then
		echo "Copying succesful!"
		echo
	else
		echo "Copying failed!"
		echo
	fi

	# Configure .bashrc to enable Starship
	echo "Configuring ${home_bashrc} to enable Starship..."
	# Check for existing configuration
	if ! grep -qxF "$init_script" "$home_bashrc"; then
		# Add new line and init script
		if { echo >> "$home_bashrc" && echo "$init_script" >> "$home_bashrc"; }; then
			echo "Starship init script added successfully!"
			echo
		else
			echo "Failed to add Starship init script to ${home_bashrc}!"
			echo "Check ${home_bashrc} manually."
			echo
		fi
	else
		echo "Detected existing Starship init script in ${home_bashrc}."
		echo "Check ${home_bashrc} manually."
		echo
	fi

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
