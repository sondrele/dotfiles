#!/bin/bash

mkdir -p "$INSTALL_DIR/bin"

ln -sf "$SRC_DIR/scripts/fuzzy-i3lock.sh" "$INSTALL_DIR/bin/fuzzy-i3lock"
ln -sf "$SRC_DIR/scripts/sshrc.sh" "$INSTALL_DIR/bin/sshrc"
