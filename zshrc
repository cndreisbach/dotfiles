# load outside files
if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.zsh); do
  . ~/.zsh/$file
done
