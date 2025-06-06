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

	if ! grep -qxF "$comment" "$home_bashrc" && ! grep -qxF "$init_script" "$home_bashrc"; then
		echo >> "$home_bashrc"
		echo "$comment" >> "$home_bashrc"
		echo "$init_script" >> "$home_bashrc"
	else
		echo "Detected existing Starship init script in $home_bashrc."
		echo "Check $home_bashrc manually."
	fi
	
	# Install starship.toml config from Aurora
	echo "Downloading starship.toml config from Aurora..."
	home_config="$HOME/.config"
	filename="starship.toml"
	destination_file="${home_config}/${filename}"
	remote_file="https://raw.githubusercontent.com/ublue-os/aurora/refs/heads/main/system_files/shared/etc/skel/.config/starship.toml"
	
	# Check if destination file already exists
	if [ -f "$destination_file" ]; then
		echo "$destination_file already exists."
	else
		# Download Starship config from Aurora
		if wget -nc -P "$home_config" "$remote_file"; then
			echo "Download succesful!"
		else
			echo "Download failed!"
		fi
	fi
