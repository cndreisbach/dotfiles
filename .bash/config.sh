### HISTORY CONTROL
export HISTCONTROL="erasedups"
shopt -s histappend
export HISTFILESIZE=50000
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit:quit:bg:fg"

### PROMPT
export PS1="\w \$ "

case $TERM in
  xterm*)
    PS1="\[\033]0;\w\007\]\w \$ "
    ;;
  *)
    PS1="\w \$ "
    ;;
esac
