#!/bin/sh
for f in 'train' 'val'
do
	echo "Création du dossier $f"
	rm -R $f/ssvm
	mkdir $f/ssvm
	echo "Concaténation des fichiers svm"
	for line in $(ls "$f/hist");do
		cat $f/hist/$line >> $f/ssvm/sift.svm
		echo "" >> $f/ssvm/sift.svm
	done
done
