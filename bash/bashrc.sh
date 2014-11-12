# install: ~/.bashrc
# Paths
IDEA_HOME=/opt/idea
JAVA_HOME=/usr/bin/java
SCALA_HOME=/opt/scala

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
fi

# Show git repository in command prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
