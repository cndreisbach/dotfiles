### VARIABLES


### ALIASES
alias dirpy3='touch .envrc; echo "layout python3" >> .envrc'
alias gr="grep -r"
alias http='python3 -m http.server'
alias k9='kill -9'
alias ll="ls -laFh"
alias mkdir="mkdir -pv"
alias vi='vim'

# Cleanup
alias rmlogs="find . -name '*.log' | xargs rm"
alias rmorig="find . -name '*.orig' | xargs rm"
alias rmpyc="find . -name '*.pyc' | xargs rm"

# Git
alias gap='git add --patch'
alias gc='git commit'
alias gca='git commit --amend -C HEAD'
alias glog="git log --graph"
alias gst='git status'

# Dokku
alias zypge='ssh -t dokku@zypge.com'

# OS X
if test (uname) = 'Darwin' 
    # Flush Directory Service cache
    alias dnsflush="dscacheutil -flushcache; and killall -HUP mDNSResponder"

    # Clean up LaunchServices to remove duplicates in the “Open With” menu
    alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

    # Empty the Trash on all mounted volumes and the main HDD
    # Also, clear Apple’s System Logs to improve shell startup speed
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"

    # Disable/enable Spotlight
    alias spotoff="sudo mdutil -a -i off"
    alias spoton="sudo mdutil -a -i on"
end

# Utilities

function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function z
  cd (fasd -d -e 'printf %s' "$argv")
end

eval (direnv hook fish)

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
