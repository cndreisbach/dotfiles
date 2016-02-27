tags = $(subst /,,$(wildcard */))
.PHONY: main clean $(tags)

main: default fish git vim python docker mac

clean:
	stow -Dv $(tags)

$(tags):
	stow -v $@
