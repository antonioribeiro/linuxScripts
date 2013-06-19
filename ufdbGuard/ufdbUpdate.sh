#!/bin/sh

while read table; do

	if [ /etc/ufdbguard/db/$table/domains -nt /etc/ufdbguard/db/$table/domains.ufdb ]; then
		/usr/ufdbguard/bin/ufdbConvertDB /etc/ufdbguard/db/$table/
		logger updating ufdbGuard db at /etc/ufdbguard/db/$table/
		updated=YES
	fi

done < <(find /etc/ufdbguard/db -mindepth 1 -maxdepth 1 -type d -printf '%f\n' )

if [ "$updated" == "YES" ]; then

  sudo /etc/init.d/ufdb restart
  
fi
