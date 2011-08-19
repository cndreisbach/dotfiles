source /etc/bash.bashrc

if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.bash); do
  . ~/.bash/$file
done

[[ $- == *i* ]] && [[ -f ~/bin/git-prompt.sh ]] && . ~/bin/git-prompt.sh

if [ -f $HOME/.Xdefaults ]; then
  xrdb -merge $HOME/.Xdefaults
fi

source "$HOME/.rbenv/completions/rbenv.bash"
rbenv rehash 2>/dev/null
