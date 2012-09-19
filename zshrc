setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

# History
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Always pushd when changing directory
setopt auto_pushd

# Completion
zstyle :compinstall filename '/Users/crnixon/.zshrc'
autoload -Uz compinit
compinit

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Initialize colors.
autoload -U colors
colors
 
# Allow for functions in the prompt.
setopt PROMPT_SUBST
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'
 
# Set the prompt.
PS1=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '
RPS1='$(rbenv_version)'

source ~/.env
source ~/.aliases

export SHELL=`which zsh`

OPATH=$PATH
eval "$(rbenv init -)"
export PATH=$OPATH
