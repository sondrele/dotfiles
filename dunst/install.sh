#!/bin/bash

DIR="$INSTALL_DIR/.config/dunst"

mkdir -p $DIR

ln -sf "$SRC_DIR/dunst/dunstrc" "$DIR/dunstrc"
