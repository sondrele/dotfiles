echo "SSHHOME: $SSHHOME"

export BASH_HOME="$SSHHOME/.sshrc.d"

# load bash config common for local system and remote systems over ssh
[ -s "$BASH_HOME/.bashrc_common" ] && . "$BASH_HOME/.bashrc_common"

# install other configs
ln -sf "$BASH_HOME/.gitconfig"            "$HOME/.gitconfig"
