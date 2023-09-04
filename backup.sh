#!/bin/bash

# Opis: Skrypt do robienia bakcupu folderu w inne miejsce
# Wersja: 0.1
# Autor: Marcin 
# Dział: 


read -p "Podaj nazwe pliku logu [/home/$USER/log_file.txt]: " LOGFILE
read -p "Podaj folder/pliki do backupowania [/usr/bin/*]: " BACKUP_LOC
read -p "Podaj lokalizacje folderu backup [/home/$USER/backup]: " BACKUP_TARGET

LOGFILE=${LOGFILE:-/home/$USER/log_file.txt}
BACKUP_LOC=${BACKUP_LOC:-/usr/bin/*}
BACKUP_TARGET=${BACKUP_TARGET:-/home/$USER/backup}

function doBackup {
	echo "Tworzenie katalogu backup" && mkdir $BACKUP_TARGET 2>/dev/null || echo "Katalog juz istnieje"
	echo >> $LOGFILE
	echo "$(date +"%d/%m/%y %r")"  >> $LOGFILE
	echo >> $LOGFILE
	echo "Kopiowanie plikow" && cp -v $BACKUP_LOC $BACKUP_TARGET >> $LOGFILE 2>&1
}

doBackup

exit 0


