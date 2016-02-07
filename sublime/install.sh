#!/bin/bash

DIR="$INSTALL_DIR/.config/sublime-text-3/Packages"

mkdir -p $DIR

# symlink entire user directory
ln -sf "$SRC_DIR/sublime/User"       "$DIR/User"
