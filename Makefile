tags = $(subst /,,$(wildcard */))
.PHONY: main clean $(tags)

main: default fish git vim python docker mac zsh

clean:
	stow -Dv $(tags)

$(tags):
	stow -v $@
