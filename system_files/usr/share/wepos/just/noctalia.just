# Copy Noctalia config to user $HOME
[group('Noctalia')]
copy-noctalia-config:
    #!/usr/bin/env bash
    set -euo pipefail

    # Variables
    source="/usr/share/wepos/noctalia"
    target="${HOME}/.config"

    # Copy Noctalia config files into user $HOME
    echo "Copying Noctalia config files into ${target}/noctalia ..."
    if cp -r "$source" "$target"; then
        echo "Copying succesful!"
        echo "Remember to set your location for weather information!"
    else
        echo "Copying failed!"
    fi
