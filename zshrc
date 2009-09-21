# load outside files
if [ -f ~/.userenv.sh ]; then
  . ~/.userenv.sh
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.zsh); do
  . ~/.zsh/$file
done
