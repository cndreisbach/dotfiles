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
