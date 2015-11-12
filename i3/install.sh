#!/bin/bash

DIR="$INSTALL_DIR/.i3"

mkdir -p $DIR

# configs
ln -sf "$SRC_DIR/i3/config" "$DIR/config"
ln -sf "$SRC_DIR/i3/i3status.conf" "$DIR/i3status.conf"
ln -sf "$SRC_DIR/i3/i3status-small.conf" "$DIR/i3status-small.conf"

# layouts
ln -sf "$SRC_DIR/i3/workspace-www.json" "$DIR/workspace-www.json"
ln -sf "$SRC_DIR/i3/terminal-2.json" "$DIR/terminal-2.json"
ln -sf "$SRC_DIR/i3/terminal-3.json" "$DIR/terminal-3.json"
