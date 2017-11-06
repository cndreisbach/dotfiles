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

which direnv > /dev/null && eval "$(direnv hook bash)"

<<<<<<< Updated upstream
if [ -e /Users/cdreisbach/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdreisbach/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
=======
export PATH="/home/clinton/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

>>>>>>> Stashed changes
