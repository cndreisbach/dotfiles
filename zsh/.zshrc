fpath=(/usr/local/share/zsh-completions $fpath)
#source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
#PROMPT='%~ $(git_super_status) \$ '
autoload -U promptinit; promptinit
prompt pure
eval "$(direnv hook zsh)"
