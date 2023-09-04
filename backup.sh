#!/bin/bash

# Opis: Skrypt do robienia bakcupu folderu w inne miejsce
# Wersja: 0.1
# Autor: Marcin 
# Dział: 

while getopts "f:s:d:" flaga
do
	case "${flaga}" in
		f) LOGFILE=${OPTARG} ;;
		s) BACKUP_LOC=${OPTARG} ;;
		d) BACKUP_TARGET=${OPTARG} ;;

	esac 
done

function doBackup {

	if [[ -s $LOGFILE ]]; then
                read -p "Plik $LOGFILE istnieje czy chcesz kontynuowac (y/n):" odp
                if [[ $odp = "y" || $odp = "Y" ]]; then
                	echo "OK"        
                else
                        exit 120
                fi
        elif [[ -e $LOGFILE ]]; then
                echo "Plik istnieje"
     
	fi
	
	echo "Tworzenie katalogu backup" && mkdir $BACKUP_TARGET 2>/dev/null || echo -e "\033[33mKatalog juz istnieje\033[0m"
	echo > $LOGFILE
	echo "$(date +"%d/%m/%y %r")"  > $LOGFILE
	echo >> $LOGFILE

	if [ -e $BACKUP_TARGET ] ; then
		read -p "Katalog $BACKUP_TARGET juz istnieje, czy chcesz kontynuowac (y/n):" decyzja
		case "$decyzja" in
			"yes" | "y" | "t" | "tak") echo "OK, lecimy dalej"
			       			   echo "Kopiowanie plikow" && cp -rv $BACKUP_LOC $BACKUP_TARGET > $LOGFILE 2>&1	;;
			"no" | "n" | "nie") echo "Przerywam skrypt"; exit 130 ;;
			*) echo "Musisz podac poprawna odpowiedz"; exit 140 ;;

		esac
	fi

	if [ $? -eq 0 ] ; then
                echo -e "\033[32mBackup zakonczony sukcesem\033[0m"
        else
                echo -e "\033[31mBackup zakończony z błędami. Sprawdź plik logów: $LOGFILE, aby zobaczyć szczegóły\033[0m"
		for plik in $(find $BACKUP_LOC -perm /u+s); do
			if [[ "$plik" == *"su"* ]] ; then
				continue;
			fi
			if [[ "$plik" == *"user-suid-wrapper" ]] ; then
				break;
			fi
			ls -la $plik >> $BACKUP_TARGET/setuid.list
		done
		if [ -s $BACKUP_TARGET/setuid.list ] ; then
			echo "WAZNE: Znaleziono pliki z niebezpiecznymi uprawnieniami"
			echo "Szczegoly w pliku $BACKUP_TARGET/setuid.list"
		fi
        fi

}

if [[ -n $LOGFILE && -n $BACKUP_LOC && $BACKUP_TARGET ]]; then
		doBackup

else
	echo
	echo "Script usage: $0 -f <logfile> -s <backup-src> -d <backup-dst>"
	echo
fi

exit 0


