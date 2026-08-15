# Rebase to wepos:latest
[group('Rebase')]
rebase-latest:
    sudo bootc switch --enforce-container-sigpolicy ghcr.io/wepeell/wepos:latest

# Rebase to wepos:testing
[group('Rebase')]
rebase-testing:
    sudo bootc switch --enforce-container-sigpolicy ghcr.io/wepeell/wepos:testing
