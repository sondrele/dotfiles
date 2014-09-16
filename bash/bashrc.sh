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
