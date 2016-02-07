#!/bin/bash

# system specific
ln -sf "$SRC_DIR/bash/profile.sh"           "$INSTALL_DIR/.profile"
ln -sf "$SRC_DIR/bash/bashrc.sh"            "$INSTALL_DIR/.bashrc"

# common for system and remote ssh connections
ln -sf "$SRC_DIR/bash/bashrc_common.sh"     "$INSTALL_DIR/.bashrc_common"
ln -sf "$SRC_DIR/bash/bash_aliases.sh"      "$INSTALL_DIR/.bash_aliases"
ln -sf "$SRC_DIR/bash/bash_utils.sh"        "$INSTALL_DIR/.bash_utils"
