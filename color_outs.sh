#!/bin/bash
for line in $(ls val/ann); do

    name=$( echo $line | cut -d "." -f1 )

    ./libsvm/svm-predict -b 1 val/svm/color.svm model/color_$name.model out/color_$name.out

done
