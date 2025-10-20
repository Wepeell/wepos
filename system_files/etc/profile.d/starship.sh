# Check if running in Bash
if [ -n "$BASH" ] && [ -n "$BASH_VERSION" ]; then
	# Check if Starship is installed
	if command -v starship &>/dev/null; then
			# Check for user specific config
			if [ -f "${HOME}/.config/starship.toml" ]; then
				# Use user config by using the default path
				unset STARSHIP_CONFIG
			else
				# Use global config
				export STARSHIP_CONFIG=/usr/share/starship/starship.toml
			fi
		# Enable Starship prompt
		# Having the init script here does work for the most part,
		# but the command duration will not work.
		# Instead, enable it in /etc/bashrc or in $HOME/.bashrc
		# eval "$(starship init bash)"
	fi
fi
