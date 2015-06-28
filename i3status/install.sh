#!/bin/bash

DIR="$INSTALL_DIR/.config/i3status"

mkdir -p $DIR

ln -sf "$SRC_DIR/i3status/config" "$DIR/config"
