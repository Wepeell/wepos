# Install Emborg (Borg Backup front-end) through uv
[group('Python')]
install-emborg:
    #!/usr/bin/env bash
    set -euo pipefail

    # Check if uv is installed
    if ! command -v uv >/dev/null 2>&1; then
        echo "Error: 'uv' is not installed or not in PATH."
        exit 1
    fi

    # Install Emborg through uv
    echo "Installing 'emborg' through uv..."
    echo
    uv tool install "emborg"
    echo
    echo "'emborg' installed."
