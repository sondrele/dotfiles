#!/bin/bash

DIR="$INSTALL_DIR/.sshrc.d"

mkdir -p $DIR

# primary script that should include all configuration found in .sshrc.d
ln -sf "$SRC_DIR/sshrc/sshrc.sh"            "$INSTALL_DIR/.sshrc"

# configuration
ln -sf "$SRC_DIR/bash/bashrc_common.sh"     "$DIR/bashrc_common.sh"
ln -sf "$SRC_DIR/bash/bash_aliases.sh"      "$DIR/bash_aliases.sh"
ln -sf "$SRC_DIR/bash/bash_colors.sh"       "$DIR/bash_colors.sh"
ln -sf "$SRC_DIR/bash/bash_utils.sh"        "$DIR/bash_utils.sh"
ln -sf "$SRC_DIR/bash/z.sh"                 "$DIR/z.sh"

ln -sf "$SRC_DIR/git/gitconfig"             "$DIR/.gitconfig"
