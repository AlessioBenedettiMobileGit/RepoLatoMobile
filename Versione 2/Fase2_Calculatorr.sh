#!/bin/bash

NComs=$(awk -F " " 'END {print(NR)}' commits.txt);

cd WS

NuF=$(awk '(NR==1) {print(NF)}' Dfile.txt)

for ct in $(seq 1 $NComs); do
	CodiceCommit=$(awk -F " " '(NR=='$ct') {print($1)}' ../commits.txt)
	git restore Dfile.txt --source=$CodiceCommit
	echo -ne "*****************\n"
	if [ $ct -eq 1 ]; then
		Arr=
		read -a Arr < Dfile.txt
		lit=${Arr[$[${#Arr[@]}-1]]}
		Arr[$[${#Arr[@]}-1]]=${lit:0:$[${#lit}-1]}
		cat Dfile.txt
	else    
		Arr1=
		read -a Arr1 < Dfile.txt
		cat Dfile.txt
		lit=${Arr1[$[${#Arr1[@]}-1]]}
                Arr1[$[${#Arr1[@]}-1]]=${lit:0:$[${#lit}-1]}
		nNuF=${#Arr1[@]}
		if [ $NuF -lt $nNuF ]; then
			for cta in $(seq $NuF $[nNuF-1]); do
				Arr[$cta]=0
			done
			NuF=$nNuF
		fi
		for ctv in $(seq 0 $[nNuF-1]); do
			Arr[$ctv]=$[ ${Arr1[ctv]}+${Arr[ctv]} ]
		done
	fi
done

git restore Dfile.txt --source=HEAD
cd ..

echo -ne "*****************\n\n"
echo ${Arr[@]}

