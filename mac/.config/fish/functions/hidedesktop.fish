function hidedesktop
	defaults write com.apple.finder CreateDesktop -bool false; and killall Finder;
end
