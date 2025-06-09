# just variables
filename := "starship.toml"
source_dir := "/usr/share/wepos/starship"
target_dir := "$HOME/.config"
source_file := source_dir + "/" + filename
target_file := target_dir + "/" + filename
home_bashrc := "$HOME/.bashrc"
comment := "# Enable Starship Shell Prompt"
init_script := 'eval "$(starship init bash)"'

# Install Starship and Aurora config
[group('Install')]
install-starship:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Shell variables
	source_file="{{source_file}}"
	target_file="{{target_file}}"
	home_bashrc="{{home_bashrc}}"
	comment="{{comment}}"
	init_script='{{init_script}}'
	
	# Install Starship with Homebrew
	echo "Installing Starship with Homebrew..."
	brew install starship
	
	# Copy Aurora starship.toml config
	echo "Copying Aurora starship.toml config..."
	# Check if target file already exists
	if [ -f "$target_file" ]; then
		echo "$target_file already exists."
	else
		# Copy source file to target
		if cp "$source_file" "$target_file"; then
			echo "Config copy succesful!"
		else
			echo "Config copy failed!"
		fi
	fi
	
	# Configure .bashrc to enable Starship
	echo "Configuring .bashrc to enable Starship..."
	# Check for existing configuration
	if ! grep -qxF "$comment" "$home_bashrc" && ! grep -qxF "$init_script" "$home_bashrc"; then
		if {
			echo >> "$home_bashrc" &&
			echo "$comment" >> "$home_bashrc" &&
			echo "$init_script" >> "$home_bashrc"
		}; then 
			echo "Starship init script added successfully!"
		else
			echo "Failed to add Starship init script to $home_bashrc!"
			echo "Check $home_bashrc manually."
		fi
	else
		echo "Detected existing Starship init script in $home_bashrc."
		echo "Check $home_bashrc manually."
	fi

# Uninstall Starship
[group('Uninstall')]
uninstall-starship:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Shell variables
	target_file="{{target_file}}"
	home_bashrc="{{home_bashrc}}"
	comment="{{comment}}"
	init_script='{{init_script}}'
	
	# Uninstall Starship from Homebrew
	echo "Uninstalling Starship..."
	brew uninstall starship || true
	
	# Remove starship.toml config
	echo "Removing starship.toml config..."
	rm -f "$target_file" || true
	
	# Undo configurations to .bashrc
	echo "Undoing configurations to .bashrc..."
	sed -i "/^$/ {N; N; /^\n$comment\n$init_script$/d}" "$home_bashrc"
	
	echo "Starship removed!"
	echo "Please, restart the terminal."
