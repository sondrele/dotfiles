#!/bin/bash
# fisher, then every plugin listed in ~/.config/fish/fish_plugins (linked from home/).
# source:   https://github.com/jorgebucaran/fisher
# verified: 2026-10
set -euo pipefail

fish -c '
    if not functions -q fisher
        curl -fsSL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    end
    fisher update
'
