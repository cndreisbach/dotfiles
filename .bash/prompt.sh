# My bash prompt, heavily inspired by @gf3’s Sexy Bash Prompt

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  DIRC="tput setaf 6"
  GITC="tput setaf 7"
  ERRORC="tput setaf 1"
  BOLD="tput bold"
  RESET="tput sgr0"
fi

export DIRC
export ERRORC
export GITC
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && echo "*"
}

function parse_git_branch() {
  local git_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/")
  [[ -z $git_branch ]] || echo " $git_branch"
}

function parse_venv() {
  local venv=$(basename $VIRTUAL_ENV 2> /dev/null)
  [[ $venv != "" ]] && echo " (python:$venv)"
}

function set_title_bar() {
  case "$TERM" in
  xterm*|rxvt*)
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    ;;
  *)
    ;;
  esac
}

function prompt_command() {
  PS1="\n$($DIRC)\w$($GITC)\$(parse_git_branch)$($RESET)\$(parse_venv)$($RESET)\n\$ "
  set_title_bar
}

function_exists update_terminal_cwd || update_terminal_cwd() { :; }

export PROMPT_COMMAND="update_terminal_cwd;prompt_command"
export PS2="- "
export PS4="\$LINENO+ "
