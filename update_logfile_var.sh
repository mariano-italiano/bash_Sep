#!/bin/bash

LOGFILE=updated_logfile.txt
echo $LOGFILE
export LOGFILE
./backup.sh
