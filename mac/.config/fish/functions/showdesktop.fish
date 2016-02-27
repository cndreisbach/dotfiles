function showdesktop
	defaults write com.apple.finder CreateDesktop -bool true; and killall Finder;
end
