# install: ~/.bashrc
# Paths
IDEA_HOME=/opt/idea-IC-135.1230
SCALA_HOME=/opt/scala-2.11.2

PATH=$PATH:$SCALA_HOME/bin:$IDEA_HOME/bin

# case insensitive autocomplete
bind "set completion-ignore-case on"

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

# Show git repository in command prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
