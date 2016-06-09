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
eval "$(fasd --init auto)"

# added by Anaconda3 2.3.0 installer
export PATH="/Users/cdreisbach/anaconda/bin:$PATH"
if [ -e /Users/cdreisbach/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdreisbach/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
