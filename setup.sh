#!/bin/sh

cd ~/dotfiles && git submodule update --init --quiet

if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "Installing Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

lt_dir=${LT_DIR:-~/Library/Application\ Support/LightTable}

if [[ -d "$lt_dir" ]]; then
	if [[ -e "$lt_dir/settings" && ! -L "$lt_dir/settings" ]]; then
    echo "Moving old LightTable settings"
    mv "$lt_dir/settings" "$lt_dir/settings.bak"
  fi
	echo "Linking LightTable settings"
  ln -sfh ~/dotfiles/lighttable/settings "$lt_dir/settings"
  echo "Linking LightTable personal plugin"
  ln -sfh ~/dotfiles/lighttable/plugins/cnd "$lt_dir/plugins/cnd"
fi

if [[ ! -e ~/bin/gherkin ]]; then
  ln -s ~/dotfiles/lib/gherkin/gherkin ~/bin/gherkin
fi
