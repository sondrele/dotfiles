#!/bin/bash

DIR="$INSTALL_DIR/.i3"

mkdir -p $DIR

# configs
ln -sf "$SRC_DIR/i3/config" "$DIR/config"
ln -sf "$SRC_DIR/i3/i3status.conf" "$DIR/i3status.conf"
ln -sf "$SRC_DIR/i3/i3status-small.conf" "$DIR/i3status-small.conf"

