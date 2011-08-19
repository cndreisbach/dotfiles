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

if [ -f $HOME/.Xdefaults ]; then
  xrdb -merge $HOME/.Xdefaults
fi

