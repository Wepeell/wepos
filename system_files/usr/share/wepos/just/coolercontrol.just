# Add kernel argument to enable all features for AMD GPUs
[group('CoolerControl')]
append-karg:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	command="rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff"
	
	# Add karg
	echo "Running command: $command"
	eval $command
	echo 'Complete, please reboot to apply changes.'

# Remove the kernel argument
[group('CoolerControl')]
delete-karg:
	#!/usr/bin/env bash
	set -euo pipefail
	
	# Variables
	command="rpm-ostree kargs --delete=amdgpu.ppfeaturemask=0xffffffff"
	
	# Remove karg
	echo "Running command: $command"
	eval $command
	echo 'Complete, please reboot to apply changes.'
