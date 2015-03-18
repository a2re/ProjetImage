#!/bin/bash
for f in 'train' 'val'
do
	for line in $(ls train/ann); do

	    ann=$( echo $line | cut -d"." -f1 )
	    bash test_ann.sh `$f`/svm/color.svm train/ann/$line > `$f`/svm/color_$ann.svm

	done
done