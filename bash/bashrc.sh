# install: ~/.bashrc

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Paths
IDEA_HOME=/opt/idea
JAVA_HOME=/usr/bin/java
SCALA_HOME=/opt/scala

# Used with Rust
LD_LIBRARY_PATH=/usr/local/lib

PATH=$PATH:$SCALA_HOME/bin:$IDEA_HOME/bin

# enable vi mode
set -o vi

# case insensitive autocomplete
bind "set completion-ignore-case on"

# set autocd
shopt -s autocd

# load aliases
if [ -f "$HOME/.bash_aliases" ]; then
. "$HOME/.bash_aliases"
fi

# load utils
if [ -f "$HOME/.bash_utils" ]; then
. "$HOME/.bash_utils"
fi

# Bash completion
if [ -f "/etc/bash_completion" ]; then
. "/etc/bash_completion"
fi

# Hub completion
if [ -f "$HOME/opt/hub/etc/hub.bash_completion.sh" ]; then
. "$HOME/opt/hub/etc/hub.bash_completion.sh"
fi

# cargo completion
if [ -f "$HOME/.multirust/toolchains/nightly/etc/bash_completion.d/cargo" ]; then
. "$HOME/.multirust/toolchains/nightly/etc/bash_completion.d/cargo"
fi

# django completion
if [ -f "$HOME/.django/django_bash_autocompletion" ]; then
. "$HOME/.django/django_bash_autocompletion"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
fi

export NVM_DIR="/home/sondre/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Show rvm, nvm, virtualenv and git in PS1
# Courtesy to https://gist.github.com/shmatov/3508983#file-bash_prompt
export GIT_PS1_SHOWDIRTYSTATE=1
function __git_branch {
  __git_ps1 "${bldylw}%s${txtrst}"
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local full="$version$gemset"
  [ "$full" != "" ] && echo -e "${bldblu}rb:$full${txtrst}"
}

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

function __info {
  local full=(
    $(__my_rvm_ruby_version)
    $(__virtualenv)
    $(__node)
    $(__git_branch)
  )
  full="${full[*]}"
  [ "$full" != "" ] && echo "[$full]"
}

PS1="┌─\$(__info)──(${bldblu}\w${txtrst})\n└─> "
