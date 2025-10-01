# Set Git username and email
[group('Git')]
_git-username-email:
	#!/usr/bin/env bash
	set -euo pipefail

	# Ask for Git username and email
	read -p "Enter your Git username: " git_username
	read -p "Enter your Git email: " git_email
	echo

	# Configure Git
	git config --global user.name "$git_username"
	git config --global user.email "$git_email"

# Generate SSH key
[group('Git')]
_git-ssh-key:
	#!/usr/bin/env bash
	set -euo pipefail

	# Set email variable
	git_email=$(git config --global user.email)

	# Check for existing SSH key
	if [ ! -f "${HOME}/.ssh/id_ed25519.pub" ]; then
		# Generate SSH key
		echo "SSH key not found."
		echo "Generating SSH key..."
		echo
		ssh-keygen -t ed25519 -C "$git_email"
		echo

		# Display the public key
		echo "Your SSH public key:"
		cat "${HOME}/.ssh/id_ed25519.pub"
		echo
	else
		echo "Using existing SSH key ~/.ssh/id_ed25519.pub."
		echo "Manually verify that your email $git_email matches SSH key."
		echo
	fi

# Setup Git
[group('Git')]
setup-git:
	@echo "Setting up Git config..."
	@echo
	@just _git-username-email
	@just _git-ssh-key
