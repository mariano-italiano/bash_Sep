#!/bin/bash

while read ip 
do
	ping -c2 $ip
	if [ $? = 0 ] ; then
		echo "Server $ip is reachable"
	elif [ $? = 1 ]; then
		echo "Server $ip is not accessible"
	fi
done < servers
