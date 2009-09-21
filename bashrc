if [ -f ~/.userenv.sh ]; then
  . ~/.userenv.sh
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.bash); do
  . ~/.bash/$file
done
