#!/bin/bash

# Check whether zsh is installed or not
if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ ! -d "$ZSH" ]; then
  echo "Installing .oh-my-zsh"
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

mkdir -p "$INSTALL_DIR/.oh-my-zsh/themes"

# common for system and remote ssh connections
ln -sf "$SRC_DIR/zsh/.zshrc"          "$INSTALL_DIR/.zshrc"
ln -sf "$SRC_DIR/zsh/oxide.zsh-theme" "$INSTALL_DIR/.oh-my-zsh/themes/oxide.zsh-theme"
