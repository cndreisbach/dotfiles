### ALIASES

alias \?="history | grep $1"
alias bell='tput bel'
alias dirpy3='touch .envrc; echo "layout python3" >> .envrc'
alias ducks="du -cks * | sort -rn | head -11"
alias gr="grep -r"
alias http='python3 -m http.server'
alias k9='kill -9'
alias mkdir="mkdir -pv"
alias pj="cd \$(ghq root)/\$(ghq list | peco)"
alias ps\?="ps ax | grep $1"
alias vi='vim'

alias ll='exa -laF'
alias tree='exa -TR'


# Cleanup
alias rmlogs="find . -name '*.log' | xargs rm"
alias rmorig="find . -name '*.orig' | xargs rm"
alias rmpyc="find . -name '*.pyc' | xargs rm"
alias rmnode="find . -name 'node_modules' -type d -d | xargs rm -rf"

# Git
alias gap='git add --patch'
alias gc='git commit'
alias gca='git commit --amend -C HEAD'
alias glog="git log --graph"
alias gst='git status'

# Node
alias new-package-json="echo '{\"private\": true}' > package.json"

# Linux
if [[ $(uname) == 'Linux' ]]; then
    alias open='gnome-open'
fi

# OS X
if [[ $(uname) == 'Darwin' ]]; then
    # Flush Directory Service cache
    alias dnsflush="dscacheutil -flushcache && killall -HUP mDNSResponder"

    # Clean up LaunchServices to remove duplicates in the “Open With” menu
    alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

    # Empty the Trash on all mounted volumes and the main HDD
    # Also, clear Apple’s System Logs to improve shell startup speed
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

    # Show/hide hidden files in Finder
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

    # Disable/enable Spotlight
    alias spotoff="sudo mdutil -a -i off"
    alias spoton="sudo mdutil -a -i on"
fi
