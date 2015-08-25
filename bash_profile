function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.bash); do
  . ~/.bash/$file
done

eval "$(direnv hook bash)"
