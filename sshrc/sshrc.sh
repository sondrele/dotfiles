echo "Active users: $(users)"
echo "SSHHOME: $SSHHOME"

export BASH_HOME="$SSHHOME/.sshrc.d"

# load bash config common for local system and remote systems over ssh
[ -s "$BASH_HOME/bashrc_common.sh" ] && . "$BASH_HOME/bashrc_common.sh"

# install other configs
ln -sf "$BASH_HOME/.gitconfig"            "$HOME/.gitconfig"

