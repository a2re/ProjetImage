#!/bin/bash

rm -R sift_model
mkdir sift_model

for name in $(cat concepts.txt); do
    
    ./libsvm/svm-train -w+1 19 -b 1 train/ssvm/sift_$name.svm sift_model/sift_$name.model
    
    break

done
