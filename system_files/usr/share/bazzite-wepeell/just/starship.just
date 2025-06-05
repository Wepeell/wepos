[private]
default:
	@just --list

# Install Starship and Aurora config
[group('Install')]
wepeell-starship
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Install Starship with Homebrew
	echo "Installing Starship with Homebrew..."
	brew install starship
	
	# Configure .bashrc to enable Starship
	echo "Configuring .bashrc to enable Starship..."
	user_bashrc="$HOME/.bashrc"

	if ! grep -qxF '# Enable Starship Shell Prompt' "$user_bashrc" && ! grep -qxF 'eval "$(starship init bash)"' "$user_bashrc"; then
		echo >> "$user_bashrc"
		echo '# Enable Starship Shell Prompt' >> "$user_bashrc"
		echo 'eval "$(starship init bash)"' >> "$user_bashrc"
	else
		echo "Detected existing Starship init script in $user_bashrc."
		echo "Check $user_bashrc manually."
	fi
	
	# Install starship.toml config from Aurora
	echo "Downloading starship.toml config from Aurora..."
	user_config="$HOME/.config"
	local_file="starship.toml"
	destination_file="${user_config}/${local_file}"
	remote_file="https://raw.githubusercontent.com/ublue-os/aurora/refs/heads/main/system_files/shared/etc/skel/.config/starship.toml"
	
	# Check if destination file already exists
	if [ -f "$destination_file" ]; then
		echo "$destination_file already exists."
	else
		# Download Starship config from Aurora
		if wget -nc -P "$user_config" "$remote_file"; then
			echo "Download succesful!"
		else
			echo "Download failed!"
		fi
	fi
