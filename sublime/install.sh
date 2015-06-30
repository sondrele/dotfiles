#!/bin/bash

DIR="$INSTALL_DIR/.config/sublime-text-3/Packages/User"

mkdir -p $DIR

ln -sf "$SRC_DIR/sublime/Default (Linux).sublime-keymap"       "$DIR/Default (Linux).sublime-keymap"
ln -sf "$SRC_DIR/sublime/Package Control.sublime-settings"     "$DIR/Package Control.sublime-settings"
ln -sf "$SRC_DIR/sublime/resize_active_group.sublime-settings" "$DIR/resize_active_group.sublime-settings"
ln -sf "$SRC_DIR/sublime/trailing_spaces.sublime-settings"     "$DIR/trailing_spaces.sublime-settings"
ln -sf "$SRC_DIR/sublime/Preferences.sublime-settings"         "$DIR/Preferences.sublime-settings"
