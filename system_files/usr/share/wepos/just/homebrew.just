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

# Install formulas
[group('Homebrew')]
install-formulas:
	#!/usr/bin/env bash
	set -euo pipefail

	# Formulas array
	formulas=(
		# borgbackup
		# clamav
		# starship
		uv
	)

	# Install formulas from array
	echo "Installing Homebrew formulas..."
	echo
	brew install "${formulas[@]}"
	echo
	echo "Formulas installed."

# Install casks
[group('Homebrew')]
install-casks:
	#!/usr/bin/env bash
	set -euo pipefail

	# List of all fonts
	# https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e

	# Casks array
	casks=(
		font-dejavu-sans-mono-nerd-font
		font-fira-code-nerd-font
		# font-noto-nerd-font
		# font-symbols-only-nerd-font
	)

	# Install casks from array
	echo "Installing Homebrew casks..."
	echo
	brew install --cask "${casks[@]}"
	echo
	echo "Casks installed."
