#!/bin/sh

cd ~/dotfiles && git submodule update --init --quiet

if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "Installing Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

if [[ ! -e ~/bin/gherkin ]]; then
  ln -s ~/dotfiles/lib/gherkin/gherkin ~/bin/gherkin
fi
