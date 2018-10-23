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

export PATH=/usr/local/bin:$PATH

which direnv > /dev/null && eval "$(direnv hook bash)"

export GIT_PROMPT_THEME=Solarized

[[ -f "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"
[[ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]] && source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
eval "$(nodenv init -)"

set -o noclobber

export EDITOR=nano
export MANPATH=/usr/share/man:/usr/local/share/man:/usr/X11/man:$HOME/man
export MANSECT=1:1p:8:2:3:3p:4:5:6:7:9:0p:tcl:n:l:p:o:0
