#!/bin/sh

if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "Installing Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

lt_dir=~/Library/Application\ Support/LightTable

if [[ -d "$lt_dir" && ! -e "$lt_dir/settings" ]]; then
  echo "Linking LightTable settings and plugins"
  ln -s ~/dotfiles/lighttable/settings "$lt_dir/settings"
  ln -s ~/dotfiles/lighttable/plugins "$lt_dir/plugins"
fi

cd ~/dotfiles && git submodule update --init --quiet
