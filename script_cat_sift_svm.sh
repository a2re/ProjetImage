#!/bin/sh
for f in 'train' 'val'
do
	echo "Création du dossier $f"
	rm -R $f/ssvm
	mkdir $f/ssvm
	echo "Concaténation des fichiers svm"
	cat $f/hist/*.hist > $f/ssvm/sift.svm
done
