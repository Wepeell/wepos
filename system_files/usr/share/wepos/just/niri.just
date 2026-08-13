# Copy Niri config to user $HOME
[group('Niri')]
copy-niri-config:
    #!/usr/bin/env bash
    set -euo pipefail

    # Variables
    source="/usr/share/wepos/niri"
    target="${HOME}/.config"

    # Copy Niri config files into user $HOME
    echo "Copying Niri config files into ${target}/niri ..."
    if cp -r "$source" "$target"; then
        echo "Copying succesful!"
        echo "Remember to first configure 'outputs.kdl' and then enable it in 'config.kdl' !"
    else
        echo "Copying failed!"
    fi
