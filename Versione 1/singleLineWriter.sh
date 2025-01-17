#!/bin/bash


echo -ne $[$RANDOM%100]" " > Dfile.txt
for ct in $(seq 2 20); do 
	echo -ne $[$RANDOM%100]" " >> Dfile.txt
	done
echo -ne "\n" >>  Dfile.txt
