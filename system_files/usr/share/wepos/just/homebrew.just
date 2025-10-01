# Re-install Homebrew
[group('Homebrew')]
reinstall-homebrew:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Uninstall Homebrew
	echo "To uninstall Homebrew run this command:"
	echo "sudo rm -rf '/etc/.linuxbrew' '/home/linuxbrew'"
	echo
	
	# Install Homebrew
	echo "To re-install Homebrew run this command:"
	echo "systemctl start brew-setup.service"
	echo
	echo "Restart terminal to use brew."
	echo

# Install Nerd Fonts
[group('Homebrew')]
install-nerd-fonts:
	#!/usr/bin/env bash
	set -euo pipefail

	# Nerd Fonts array
	nerdfonts=(
		font-fira-code-nerd-font
		# font-noto-nerd-font
		# font-symbols-only-nerd-font
	)

	# Install Nerd Fonts with Homebrew from array
	echo "Installing Nerd Fonts with Homebrew..."
	echo
	brew install --cask "${nerdfonts[@]}"
	echo
	echo "Nerd Fonts installed."
	echo

# Install Starship and Aurora config
[group('Homebrew')]
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

	echo "Restart terminal for changes to take effect."
	echo

# Uninstall Starship
[group('Homebrew')]
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
