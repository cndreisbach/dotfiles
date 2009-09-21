. ~/.aliases

### HISTORY CONTROL
export HISTCONTROL="erasedups"
shopt -s histappend

### COMPLETION
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
  COMPREPLY=($(compgen -W "`rake -s -T | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake
complete -C "gemedit --complete" gemedit
complete -W "list add edit accept decline hide comment done braindump editdump feedback" hm

if [[ $TERM =~ "xterm" ]]; then
  trap 'echo -e "\e]1;$working_on>$BASH_COMMAND<\007\c"' DEBUG
fi
