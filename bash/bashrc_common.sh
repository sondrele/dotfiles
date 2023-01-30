# This script is executed by bash/zsh on the local machine, as well as bash
# on remote servers (with sshrc)

# load colors that might be used by scripts later
[ -s "$BASH_HOME/bash_colors.sh" ] && . "$BASH_HOME/bash_colors.sh"

# load aliases
[ -s "$BASH_HOME/bash_aliases.sh" ] && . "$BASH_HOME/bash_aliases.sh"

# load utils
[ -s "$BASH_HOME/bash_utils.sh" ] && . "$BASH_HOME/bash_utils.sh"

# load z
[ -s "$BASH_HOME/z.sh" ] && . "$BASH_HOME/z.sh"

# load bash_completion
[ -s "/etc/bash_completion" ] && . "/etc/bash_completion"

# enable vi mode
set -o vi

# case insensitive autocomplete
bind "set completion-ignore-case on"

# set autocd
shopt -s autocd

# rust and cargo
if is_installed rustc; then
    [ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
    RUST_HOME=$(rustc --print sysroot)
    [ -s "$RUST_HOME/etc/bash_completion.d/cargo" ] && . "$RUST_HOME/etc/bash_completion.d/cargo"
    export RUST_SRC_PATH="$RUST_HOME/lib/rustlib/src/rust/src"
fi

# django completion
[ -s "$HOME/.django/django_bash_autocompletion" ] && . "$HOME/.django/django_bash_autocompletion"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH=$PATH:$HOME/bin

# This loads nvm and its bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Show rvm, nvm, virtualenv and git in PS1
# Courtesy to https://gist.github.com/shmatov/3508983#file-bash_prompt
export GIT_PS1_SHOWDIRTYSTATE=1
function __git_branch {
  __git_ps1 "${bldylw}%s${txtrst}"
}

# First disable the standard prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
function __virtualenv {
  local env=$(basename "$VIRTUAL_ENV")
  [ "$env" != "" ] && echo -e "${bldgrn}py:$env${txtrst}"
}

function __node {
  if hash node 2>/dev/null; then
    local v=$(node -v)
  fi
  [ "$v" != "" ] && echo -e "${bldred}n:${v:1}${txtrst}"
}

# TODO: add support for `asdf current` instead

function __info {
  local full=(
    $(__virtualenv)
    $(__node)
    $(__git_branch)
  )
  full="${full[*]}"
  [ "$full" != "" ] && echo "[$full]"
}

PS1="\$(__info) (${bldblu}\w${txtrst}) - ${txtpur}\u@\h${txtrst}\n$ "
