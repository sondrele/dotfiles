#!/bin/bash
# mise from its Ubuntu PPA, then every tool listed in ~/.config/mise/config.toml (linked from home/).
# source:   https://mise.jdx.dev/installing-mise.html
# verified: 2026-10
set -euo pipefail

if ! command -v mise >/dev/null; then
    command -v add-apt-repository >/dev/null || sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:jdxcode/mise
    sudo apt-get update
    sudo apt-get install -y mise
fi

mise install --yes
