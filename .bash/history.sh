# Append to history file instead of overwriting it.
shopt -s histappend

# Ignore duplicates in history, lines that start with a space, and some
# common commands.
export HISTCONTROL="ignoreboth"
export HISTIGNORE="exit:quit:bg:fg:ls:history"

# Allow for a large amount of commands to be stored in history instead
# of truncating early.
export HISTFILESIZE=50000
export HISTSIZE=10000

# Record the date and time of every command in history.
export HISTTIMEFORMAT='%F %T '
