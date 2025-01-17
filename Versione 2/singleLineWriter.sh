#!/bin/bash

NF=$[$RANDOM%20]; if [ $NF -eq 0 ]; then NF=1; fi
echo -ne $[$RANDOM%100] > Dfile.txt
if [ $NF -gt 1 ]; then
	for ct in $(seq 2 $NF); do 
		echo -ne " "$[$RANDOM%100] >> Dfile.txt
	done
fi
echo -ne "\n" >>  Dfile.txt
