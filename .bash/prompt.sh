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
  TIMERC="tput setaf 3"
  BOLD="tput bold"
  RESET="tput sgr0"
fi

export DIRC
export ERRORC
export TIMERC
export GITC
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && echo "*"
}

function parse_git_branch() {
  local git_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/")
  [[ $git_branch != "" ]] && echo " $git_branch"
}

function timer_start() {
  timer=${timer:-$SECONDS}
}

function timer_stop() {
  timer_show=$(($SECONDS - $timer))
  unset timer
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
  local exit_status=$?
  timer_stop

  local time_display=""
  local error_msg=""

  [[ $timer_show -ge "5" ]] && time_display=" ${timer_show}s"
  [[ $exit_status -ne "0" ]] && error_msg=" $($ERRORC)${exit_status}"

  PS1="\n$($DIRC)\w$($GITC)\$(parse_git_branch)$($TIMERC)${time_display}${error_msg}$($RESET)\n\$ "
  set_title_bar
}

export PROMPT_COMMAND=prompt_command
export PS2="- "
export PS4="\$LINENO+ "

function run_on_debug() {
    timer_start
}

trap run_on_debug DEBUG

