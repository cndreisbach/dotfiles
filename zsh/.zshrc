fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist

export EDITOR=nano
source ~/.aliases.sh
export PATH=/Users/clinton/Library/Python/3.7/bin:$PATH
eval "$(thefuck --alias wtf)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
