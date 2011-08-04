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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ "`rvm-prompt`" == ".rvm-" ]; then 
  rvm use
fi
