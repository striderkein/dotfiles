#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# detect bash | zsh
if [ -n "${BASH_VERSION-}" ]; then
  ln -sf ~/dotfiles/.profile ~/.bash_profile
  ln -sf ~/dotfiles/.rc ~/.bashrc
elif [ -n "${ZSH_VERSION-}" ]; then
  ln -sf ~/dotfiles/.profile ~/.zprofile
  ln -sf ~/dotfiles/.rc ~/.zshrc
# elif [ -n "${RANDOM-}" ]; then
#   # case: other
# else
#   # case: sh
fi

# Git settings
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitattributes ~/.gitattributes
ln -sf ~/dotfiles/.gitignore ~/.gitignore
