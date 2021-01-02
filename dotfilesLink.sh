#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# detect bash | zsh
if [ -n "${BASH_VERSION-}" ]; then
  ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
  ln -sf ~/dotfiles/.bashrc ~/.bashrc
elif [ -n "${ZSH_VERSION-}" ]; then
  ln -sf ~/dotfiles/.bash_profile ~/.zprofile
  ln -sf ~/dotfiles/.bashrc ~/.zshrc
# elif [ -n "${RANDOM-}" ]; then
#   # case: other
# else
#   # case: sh
fi

# Git settings
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitattributes ~/.gitattributes
ln -sf ~/dotfiles/.gitignore ~/.gitignore
