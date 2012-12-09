if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.bash); do
  . ~/.bash/$file
done

if [ -f ~/.Xdefaults ]; then
  xrdb -merge ~/.Xdefaults
fi

