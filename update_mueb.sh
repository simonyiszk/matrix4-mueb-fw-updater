#!/bin/bash

#usage: ./update_mueb.sh 10.0.18.5 /tmp/legujabb_patchelt_tutijo.bin


MUEB_CONTROLLER="/tmp/Command.exe "
IP="127.0.0.1" #TODO change to $1
FIRMWARE="/tmp/test.bin" #TODO change to $2

#TODO HELP screen is the argument list is too short
#TODO check firmware size

$MUEB_CONTROLLER $IP enable-firmware-update
nc $IP 1997 < $FIRMWARE

local_checksum=0 #TODO fix
remote_checksum=`$MUEB_CONTROLLER $IP get-next-firm-checksum 2> /dev/null`

if [ local_checksum != remote_checksum ] then
	echo "Checksum missmatch on IP $IP" > /dev/stderr
	exit 1
fi

$MUEB_CONTROLLER $IP refurbish


