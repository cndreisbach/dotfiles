function rmpyc
	find . -name '*.pyc' | xargs rm $argv;
end
