[private]
default:
	@just --list

# Install Nerd Fonts
[group('Install')]
wepeell-nerd-fonts:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Install Nerd Fonts with Homebrew
	echo "Installing Nerd Fonts with Homebrew..."
	brew install --cask font-fira-code-nerd-font \
						# font-noto-nerd-font \
						# font-symbols-only-nerd-font
