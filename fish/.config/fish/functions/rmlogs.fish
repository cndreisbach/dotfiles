function rmlogs
	find . -name '*.log' | xargs rm $argv;
end
