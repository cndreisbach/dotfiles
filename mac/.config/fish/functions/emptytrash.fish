# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
function emptytrash
	sudo rm -rfv /Volumes/*/.Trashes
	sudo rm -rfv ~/.Trash
	sudo rm -rfv /private/var/log/asl/*.asl
end
