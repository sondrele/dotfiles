#!/bin/bash

mkdir -p "$INSTALL_DIR/.bashrc.d"

# download z if it does not already exist
if [ ! -f "$SRC_DIR/bash/z.sh" ]; then
    wget "https://raw.githubusercontent.com/rupa/z/master/z.sh" -O "$SRC_DIR/bash/z.sh"
fi

# system specific
ln -sf "$SRC_DIR/bash/profile.sh"           "$INSTALL_DIR/.profile"
ln -sf "$SRC_DIR/bash/bashrc.sh"            "$INSTALL_DIR/.bashrc"

# common for system and remote ssh connections
ln -sf "$SRC_DIR/bash/bashrc_common.sh"     "$INSTALL_DIR/.bashrc.d/bashrc_common.sh"
ln -sf "$SRC_DIR/bash/bash_aliases.sh"      "$INSTALL_DIR/.bashrc.d/bash_aliases.sh"
ln -sf "$SRC_DIR/bash/bash_colors.sh"       "$INSTALL_DIR/.bashrc.d/bash_colors.sh"
ln -sf "$SRC_DIR/bash/bash_utils.sh"        "$INSTALL_DIR/.bashrc.d/bash_utils.sh"
ln -sf "$SRC_DIR/bash/z.sh"                 "$INSTALL_DIR/.bashrc.d/z.sh"
