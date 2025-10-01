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
