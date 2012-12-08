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

# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats "(%s/%b%m) %6.6i %c%u"
zstyle ':vcs_info:git*' actionformats "(%s/%b%m|%a) %6.6i %c%u"

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
precmd_functions+='precmd_vcs_info'
chpwd_functions+='ch_venv'

# Set the prompt.
PS1=$'%{${fg[cyan]}%}%B%~%b $(progenv) ${vcs_info_msg_0_}%{${fg[default]}%}\n$ '
function last_command() {
  echo `history -1 | cut -d ' ' -f 3-20 | realiaser`
}
RPROMPT='%{$fg[$NCOLOR]%}%p $(last_command)%{$reset_color%}'

source ~/.env
source ~/.aliases

export SHELL=`which zsh`

OPATH=$PATH
eval "$(rbenv init -)"
export PATH=$OPATH

source /usr/local/share/python/virtualenvwrapper.sh
ch_venv
