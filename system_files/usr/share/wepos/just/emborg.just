# Install uv (Python package manager) through Homebrew
[group('Emborg')]
[private]
install-uv:
	#!/usr/bin/env bash
	set -euo pipefail

	# Install uv through Homebrew
	echo "Installing 'uv' formula through Homebrew..."
	echo
	brew install "uv"
	echo
	echo "'uv' formula installed."

# Install pipxu (Python application manager) through uv
[group('Emborg')]
[private]
install-pipxu:
	#!/usr/bin/env bash
	set -euo pipefail

	# Install pipxu through uv
	echo "Installing 'pipxu' through uv..."
	echo
	uv tool install "pipxu"
	echo
	echo "'pipxu' installed."

# Install Emborg (Borg Backupu front-end) through pipxu
[group('Emborg')]
[private]
install-emborg:
	#!/usr/bin/env bash
	set -euo pipefail

	# Install emborg through pipxu
	echo "Installing 'emborg' through pipxu..."
	echo
	pipxu install "emborg"
	echo
	echo "'emborg' installed."

# Setup Emborg
[group('Emborg')]
setup-emborg:
	@echo "Setting up Emborg..."
	@echo
	@just install-uv
	@echo
	@just install-pipxu
	@echo
	@just install-emborg
