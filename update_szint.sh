#!/bin/bash

for i in {5..12}
do
	./update_mueb.sh "10.6.$1.$i" "$2"
done
