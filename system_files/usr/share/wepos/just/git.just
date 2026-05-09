# Set Git username and email
[group('Git')]
[private]
git-username-email:
    #!/usr/bin/env bash
    set -euo pipefail

    # Ask for Git username and email
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email

    # Configure Git
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"

# Generate SSH key
[group('Git')]
[private]
git-ssh-key:
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
    else
    	echo "Using existing SSH key ~/.ssh/id_ed25519.pub."
    	echo "Manually verify that your email $git_email matches SSH key."
    fi

# Sign all commits by default
[group('Git')]
[private]
git-sign-commits:
    #!/usr/bin/env bash
    set -euo pipefail

    # Use SSH key for signing
    git config --global gpg.format ssh
    git config --global user.signingkey ~/.ssh/id_ed25519.pub
    git config --global commit.gpgsign true

# Setup Git
[group('Git')]
setup-git:
    @echo "Setting up Git config..."
    @echo
    @just git-username-email
    @echo
    @just git-ssh-key
    @echo
    @just git-sign-commits
