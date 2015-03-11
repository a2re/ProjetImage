#!/bin/bash

if [ ! -d "train/sift/" ]; then
	echo "Création du dossier sift"
	mkdir "train/sift"
fi

for line in $(ls /home/m/mulhemp/sift/train); do
	
	if [ $line != "1nn" ]; then
    	bash test_sift.sh $line
    fi

done
