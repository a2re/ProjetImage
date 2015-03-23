#!/bin/bash

rm -R "train/sift"
mkdir "train/sift"

for line in $(ls /home/m/mulhemp/sift/train/*.sift | cut -d / -f 7-); do	
	bash test_sift.sh $line
done
