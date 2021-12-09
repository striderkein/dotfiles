#!/bin/sh
dir=$(cd $(dirname $0) && pwd)
ln -sf $dir/.vimrc ~/.vimrc

# detect bash | zsh
if [ -n "${BASH_VERSION-}" ]; then
  ln -sf $dir/.profile ~/.profile
  ln -sf $dir/.bashrc ~/.bashrc
elif [ -n "${ZSH_VERSION-}" ]; then
  ln -sf $dir/.profile ~/.zprofile
  ln -sf $dir/.zshrc ~/.zshrc
# elif [ -n "${RANDOM-}" ]; then
#   # case: other
# else
#   # case: sh
fi

# Git settings
ln -sf $dir/.gitconfig ~/.gitconfig
ln -sf $dir/.gitignore ~/.gitignore
