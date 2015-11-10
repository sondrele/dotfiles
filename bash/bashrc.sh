# install: ~/.bashrc

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

# Show git repository in command prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \n\$\[\033[00m\] '

export NVM_DIR="/home/sondre/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
