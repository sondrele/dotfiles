#!/bin/bash
# fish as the login shell. Takes effect after logging out and in again.
set -euo pipefail

fish_path=$(command -v fish)

if [ "$(getent passwd "$USER" | cut -d: -f7)" = "$fish_path" ]; then
    exit 0
fi

sudo chsh -s "$fish_path" "$USER"
echo "Login shell set to $fish_path. Log out and in again for it to take effect."
