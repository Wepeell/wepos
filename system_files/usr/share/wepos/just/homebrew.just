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
