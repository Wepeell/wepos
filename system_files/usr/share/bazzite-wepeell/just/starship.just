[private]
default:
	@just --list

# Install Starship and Aurora config
[group('Install')]
wepeell-starship:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Install Starship with Homebrew
	echo "Installing Starship with Homebrew..."
	brew install starship
	
	# Configure .bashrc to enable Starship
	echo "Configuring .bashrc to enable Starship..."
	home_bashrc="$HOME/.bashrc"
	comment="# Enable Starship Shell Prompt"
	init_script='eval "$(starship init bash)"'
	
	# Check for existing configuration
	if ! grep -qxF "$comment" "$home_bashrc" && ! grep -qxF "$init_script" "$home_bashrc"; then
		echo >> "$home_bashrc"
		echo "$comment" >> "$home_bashrc"
		echo "$init_script" >> "$home_bashrc"
	else
		echo "Detected existing Starship init script in $home_bashrc."
		echo "Check $home_bashrc manually."
	fi
	
	# Install starship.toml config from Aurora
	echo "Installing starship.toml config from Aurora..."
	source_dir="/usr/share/bazzite-wepeell/starship"
	target_dir="$HOME/.config"
	filename="starship.toml"
	source_file="${source_dir}/${filename}"
	target_file="${target_dir}/${filename}"
	
	
	# Check if target file already exists
	if [ -f "$target_file" ]; then
		echo "$target_file already exists."
	else
		# Copy source file to target
		if cp "$source_file" "$target_file"; then
			echo "Config install succesful!"
		else
			echo "Config install failed!"
		fi
	fi
