#!/bin/bash
for line in $(ls train/ann); do

    name=$( echo $line | cut -d"." -f1 )
    
    ./libsvm/svm-train -w+1 19 -b 1 train/svm/color_$name.svm model/color_$name.model

done
