#!/bin/bash
for f in 'train' 'val'
do
	for name in $(cat concepts.txt); do
	
		echo "Traitement de $name : "
	    bash test_ann.sh $f/ssvm/sift.svm train/ann/$name.ann > $f/ssvm/sift_$name.svm

	done
done
