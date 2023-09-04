#!/bin/bash

echo "Pierwsze rozwiazanie"
for i in {1..15..2}; do
	echo $i
done

echo
echo "Drugie rozwiazanie"
for i in {1..15} ; do
	if (( i % 2 == 0 )) ; then
		continue
	else
		echo $i
	fi
	
done

