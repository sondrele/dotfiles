#!/bin/bash

mkdir -p "$INSTALL_DIR/bin"

ln -sf "$SRC_DIR/utils/spotify-control.py" "$INSTALL_DIR/bin/spotify-control"
