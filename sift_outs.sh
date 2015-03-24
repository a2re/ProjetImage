#!/bin/bash

rm -R sift_out
mkdir sift_out

for name in $(cat concepts.txt); do

	echo "Traitement de des fichiers out pour $name :"
    ./libsvm/svm-predict -b 1 val/ssvm/sift.svm sift_model/sift_$name.model sift_out/sift_$name.out

done
