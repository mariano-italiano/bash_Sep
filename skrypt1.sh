#!/bin/bash

# Sprawdzenie argumentów
if [ $# -eq 2 ]; then
    imie=$1
    wiek=$2
else
    echo "Usage: $0 <imie> <wiek>"
    exit 1
fi

# Wyswietlenie informacji
echo "Imie: $imie"
echo "Wiek: $wiek"
echo 0

