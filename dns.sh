#!/bin/sh
# Simple program to change nameservers
sed -i '' "/nameserver/d" resolv.conf
echo '1.Manual Nameservers\n 2.Shekan nameservers {178.22.122.100 & 185.51.200.2}\n 3.Default {8.8.8.8}'
read VAL
if [ "$VAL" -eq "1" ]
	then
		echo 'plz input nameservers(break with empty line)'
		while read INPUT 
		do
			[[ $INPUT ]] || break
			sed -i -e '$s/$/\nnameserver '${INPUT}' \n/' resolv.conf
		done
 elif [ "$VAL" -eq "2" ]
	then 
               sed -i -e '$s/$/nameserver 178.22.122.100\nnameserver 185.51.200.2\n/' resolv.conf
 elif [ "$VAL" -eq "3" ]
	then
		sed -i -e '$s/$/nameserver 8.8.8.8\n/' resolv.conf
else exit
fi
