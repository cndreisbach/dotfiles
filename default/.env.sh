export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Java
export JAVA_OPTS="-Dfile.encoding=UTF-8"

export SURFRAW_text_browser=links
export SURFRAW_graphical=0

if [[ -e ~/.env.local ]]; then
  source ~/.env.local
fi


pathappend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathprepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}


pathprepend ~/go/bin
pathprepend ~/bin
pathappend /Applications/Racket\ v7.0/bin
