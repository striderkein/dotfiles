#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc

# detect bash | zsh
if [ -n "${BASH_VERSION-}" ]; then
  ln -sf $SCRIPT_DIR/.profile ~/.profile
  ln -sf $SCRIPT_DIR/.bashrc ~/.bashrc
elif [ -n "${ZSH_VERSION-}" ]; then
  ln -sf $SCRIPT_DIR/.profile ~/.zprofile
  ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
# elif [ -n "${RANDOM-}" ]; then
#   # case: other
# else
#   # case: sh
fi

# Git settings
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sf $SCRIPT_DIR/.gitattributes ~/.gitattributes
ln -sf $SCRIPT_DIR/.gitignore ~/.gitignore
