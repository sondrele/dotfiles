# install: ~/.bashrc

# Paths, if needed
# JAVA_HOME=
# SCALA_HOME=
# GRADLE_HOME=

# Used with Rust
LD_LIBRARY_PATH=/usr/local/lib

# This path have to be exported in order to properly use .bashrc_common
export BASH_HOME="$HOME/.bashrc.d"

# load bash config common for local system and remote systems over ssh
[ -s "$BASH_HOME/bashrc_common.sh" ] && . "$BASH_HOME/bashrc_common.sh"
