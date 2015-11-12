#!/bin/bash

mkdir -p "$INSTALL_DIR/bin"

ln -sf "$SRC_DIR/scripts/fuzzy-i3lock.sh" "$INSTALL_DIR/bin/fuzzy-i3lock"
ln -sf "$SRC_DIR/scripts/terminal-layout.sh" "$INSTALL_DIR/bin/terminal-layout"
