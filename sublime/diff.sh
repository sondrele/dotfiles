#!/bin/bash

DIR=".config/sublime-text-3/Packages/User"

diff_files "sublime/Default (Linux).sublime-keymap"       "$DIR/Default (Linux).sublime-keymap"
diff_files "sublime/Package Control.sublime-settings"     "$DIR/Package Control.sublime-settings"
diff_files "sublime/resize_active_group.sublime-settings" "$DIR/resize_active_group.sublime-settings"
diff_files "sublime/trailing_spaces.sublime-settings"     "$DIR/trailing_spaces.sublime-settings"
diff_files "sublime/Preferences.sublime-settings"         "$DIR/Preferences.sublime-settings"
