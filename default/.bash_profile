function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

if [ -f ~/.env.sh ]; then
  . ~/.env.sh
fi

if [ -f ~/.aliases.sh ]; then
  . ~/.aliases.sh
fi

for file in $(ls ~/.bash); do
 . ~/.bash/$file
done

export PATH=/usr/local/bin:$PATH

which direnv > /dev/null && eval "$(direnv hook bash)"

export GIT_PROMPT_THEME=Solarized

[[ -f "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"
[[ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]] && source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
#eval "$(nodenv init -)"

set -o noclobber

export EDITOR=nano
export GROOVY_HOME=/usr/local/opt/groovy/libexec

eval $(thefuck --alias wtf)
