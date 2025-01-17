#!/bin/bash

NComs=$(awk -F " " 'END {print(NR)}' commits.txt);

cd WS

NF=$(awk '(NR==1) {print(NF)}' Dfile.txt)

for ct in $(seq 1 $NComs); do
	CodiceCommit=$(awk -F " " '(NR=='$ct') {print($1)}' ../commits.txt)
        git restore Dfile.txt --source=$CodiceCommit

	if [ $ct -eq 1 ]; then
		read -a Arr < Dfile.txt
	else    
		read -a Arr1 < Dfile.txt
		for ctv in $(seq 0 $[NF-1]); do
			Arr[$ctv]=$[${Arr[ctv]}+${Arr1[ctv]}]
		done
	fi
done
git restore Dfile.txt --source=HEAD
cd ..

echo ${Arr[@]}


