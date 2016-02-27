function rmorig
	find . -name '*.orig' | xargs rm $argv;
end
