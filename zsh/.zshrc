fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist

export EDITOR=nano
source ~/.aliases.sh
export PATH=/Users/clinton/Library/Python/3.7/bin:$PATH

# Python env vars
export PYTHONBREAKPOINT="pudb.set_trace"

# Dumb OS X fixes
export ARCHFLAGS="-arch x86_64"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

eval "$(thefuck --alias wtf)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(pyenv init -)"
