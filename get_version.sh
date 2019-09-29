#!/bin/bash

TOOL=../matrix4-mueb-utility/mueb-utility

for szint in $(seq $1 $2)
do
	for szoba in {5..12}
	do
		echo -n $szint _ $szoba ": "
		ping -c1 "10.6.$szint.$szoba" > /dev/null 2> /dev/null
		if [[ $? != 0 ]]; then
		        echo "Nem elerheto MUEB"
        		continue
		fi

		$TOOL "10.6.$szint.$szoba" get-status 2>&1 | grep version | cut -d':' -f3
	done
done
