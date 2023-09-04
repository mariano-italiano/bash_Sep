#!/bin/bash

# Definicja funkcji
licz() {
        # Wczytanie liczb od uzytkownika
        echo -n "Podaj pierwsza liczbe: "
        read a
        echo -n "Podaj pierwsza liczbe: "
        read b
        echo "$a + $b =" $(($a + $b))
}

# Wywolanie funkcji
licz
exit 0
