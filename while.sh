#!/bin/bash

A=5
LICZ=0

until [ $A -lt 8 ]
do
	echo "Liczba $A"
	sleep 3
	LICZ=$(($LICZ + 1))

	if [ $LICZ -eq 4 ] ; then
		echo "Osiagnalem wartosc 4, przerywam petle..."
		break;
	fi
done

while true
do
	echo "petla nieskonczona"
	sleep 2
done
