fpath=(/usr/local/share/zsh-completions $fpath)

#autoload -U promptinit; promptinit
#prompt pure

source ~/.aliases.sh
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
