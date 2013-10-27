#!/bin/sh

if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "Installing Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

cd ~/dotfiles && git submodule update --init --quiet
