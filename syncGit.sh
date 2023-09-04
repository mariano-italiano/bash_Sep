IPS=(51.136.112.65 51.136.112.121 51.136.112.125 51.136.114.6 51.136.114.104 51.136.114.106)
USER="localadmin"

for ip in ${IPS[@]}
do
	echo "Lacze sie z serwerem: $ip"
	filesBefore=`ssh localadmin@$ip 'cd bash_Sep; ls -la | wc -l'`
	echo "Licza plikow przed refreshem: $filesBefore"
	ssh ${USER}@$ip 'cd bash_Sep; git pull > /dev/null'
	filesAfter=`ssh localadmin@$ip 'cd bash_Sep; ls -la | wc -l'`
	echo "Licza plikow po refreshu: $filesAfter"

done

