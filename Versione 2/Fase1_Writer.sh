#!/bin/bash


rm -rf *.txt
rm -rf WS; mkdir WS; cd WS

# rm -rf .git*
git init
git config --global user.name "user"
git config --global user.email "account@email.dom"

echo -ne ".gitignore\n*.sh" > .gitignore

for cti in $(seq 1 15); do
	../singleLineWriter.sh
	if [ $cti -eq 1 ]; then git add *.txt; fi
	git commit -a -m "Commit n."$cti
done

git log --oneline --graph --decorate --all
git log --oneline >> ../commits.txt
cd ..

