#!/bin/bash
for f in 'train' 'val'
do
	for name in $(cat concepts.txt); do

	    bash test_ann.sh $f/svm/color.svm train/ann/$name.ann > $f/svm/color_$name.svm

	done
done
