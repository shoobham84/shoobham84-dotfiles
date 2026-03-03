#!/bin/bash

DOTFILES_DIR=~/dotfiles

# Create symlinks
ln -sf $DOTFILES_DIR/nvim ~/.config/nvim
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

echo "Dotfiles installation complete! Here's the config of the supreme coder Lord Shubham."
