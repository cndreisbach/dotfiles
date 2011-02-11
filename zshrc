# load outside files
if [ -f ~/.env ]; then
  . ~/.env
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

for file in $(ls ~/.zsh | grep -v "zwc$"); do
  [ -f ~/.zsh/$file ] && . ~/.zsh/$file
done

zsrc () {
	autoload -U zrecompile
	[ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
	[ -f ~/.zlogout ] && zrecompile -p ~/.zlogout
	[ -f ~/.zlogin ] && zrecompile -p ~/.zlogin
	[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
  for a in $(ls ~/.zsh | grep -v "zwc$"); do
    [ -f ~/.zsh/$a ] && zrecompile -p ~/.zsh/$a
  done
  [ -d ~/.zsh/functions ] && zrecompile -p ~/.zsh/functions.zwc ~/.zsh/functions/*
}

