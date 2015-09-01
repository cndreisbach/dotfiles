.PHONY: work

home:
	stow -v default
	stow -v mac
	stow -v vim

work:
	stow -v default
	stow -v mac
	stow -v emacs