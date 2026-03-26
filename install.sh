#!/bin/bash

DOTFILES_DIR=$(pwd)

echo "Installing dotfiles for Lord Shubham..."

# Create config dir if missing
mkdir -p ~/.config

# Symlink configs
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh/.p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

echo "Dotfiles installation complete!"
