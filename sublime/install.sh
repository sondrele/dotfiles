#!/bin/bash

DIR="$INSTALL_DIR/.config/sublime-text-3/Packages/User"

mkdir -p $DIR

cp "$SRC_DIR/sublime/Default (Linux).sublime-keymap"       "$DIR/Default (Linux).sublime-keymap"
cp "$SRC_DIR/sublime/Package Control.sublime-settings"     "$DIR/Package Control.sublime-settings"
cp "$SRC_DIR/sublime/resize_active_group.sublime-settings" "$DIR/resize_active_group.sublime-settings"
cp "$SRC_DIR/sublime/trailing_spaces.sublime-settings"     "$DIR/trailing_spaces.sublime-settings"
cp "$SRC_DIR/sublime/Preferences.sublime-settings"         "$DIR/Preferences.sublime-settings"