#!/usr/bin/env bash

# https://zwbetz.com/set-environment-variables-in-your-bash-shell-from-a-env-file-version-2/

# Show env vars
grep -v '^#' "$DOTFILES/.env"

# Export env vars
set -o allexport
source "$DOTFILES/.env"
set +o allexport
