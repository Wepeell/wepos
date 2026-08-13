# Add kernel argument to enable all features for AMD GPUs
[group('CoolerControl')]
append-karg:
    #!/usr/bin/env bash
    set -euo pipefail

    # Add karg
    echo "Adding karg to enable all features for AMD GPUs..."
    echo
    rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff
    echo

    # Check karg
    if rpm-ostree kargs | grep -q 'amdgpu.ppfeaturemask=0xffffffff'; then
        echo "Kernel argument successfully added."
        echo "Please reboot to apply changes."
    else
        echo "Failed to add kernel argument." >&2
        exit 1
    fi

# Remove the kernel argument for AMD GPUs
[group('CoolerControl')]
delete-karg:
    #!/usr/bin/env bash
    set -euo pipefail

    # Remove karg
    echo "Removing karg for AMD GPUs..."
    echo
    rpm-ostree kargs --delete=amdgpu.ppfeaturemask=0xffffffff || true
    echo

    # Check karg
    if rpm-ostree kargs | grep -q 'amdgpu.ppfeaturemask=0xffffffff'; then
        echo "Kernel argument still present, removal may have failed." >&2
        exit 1
    else
        echo "Kernel argument successfully removed."
        echo "Please reboot to apply changes."
    fi
