function dnsflush
	dscacheutil -flushcache; and killall -HUP mDNSResponder;
end
