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
		eval "$(starship init bash)"
	fi
fi
