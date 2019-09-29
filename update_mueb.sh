#!/bin/bash

#usage: ./update_mueb.sh 10.0.18.5 /tmp/legujabb_patchelt_tutijo.bin


MUEB_CONTROLLER="../matrix4-mueb-utility/mueb-utility "
IP=$1
FIRMWARE=$2

#TODO HELP screen is the argument list is too short
#TODO check firmware size

echo "Ping teszt"
ping -c1 $IP > /dev/null 2> /dev/null
if [ ! $? ]; then
	echo "Nem elerheto MUEB"
	exit 1
fi

$MUEB_CONTROLLER $IP enable-update
echo "Frissites parancs kiadva"
nc -N -q0 -w6 $IP 1997 < $FIRMWARE
echo "Firmware felkuldve"

echo $?

local_checksum=0 #TODO fix
remote_checksum=`$MUEB_CONTROLLER $IP get-next-firm-checksum 2> /dev/null`

if [ local_checksum != remote_checksum ]; then
	echo "Checksum missmatch on IP $IP" > /dev/stderr
#	exit 1
fi

$MUEB_CONTROLLER $IP refurbish

echo "Amen " $1


