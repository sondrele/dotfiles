#!/bin/bash

mkdir -p "$INSTALL_DIR/bin"

ln -sf "$SRC_DIR/utils/i3-exit.py" "$INSTALL_DIR/bin/i3-exit"
ln -sf "$SRC_DIR/utils/spotify-control.py" "$INSTALL_DIR/bin/spotify-control"
