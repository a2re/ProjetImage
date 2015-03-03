#!/bin/bash

for line in $(ls train/ann); do

    ann=$( echo $line | cut -d"." -f1 )
    bash test_ann.sh train/svm/color.svm train/ann/$line > train/svm/color_$ann.svm

done

for line in $(ls val/ann); do

    ann=$( echo $line | cut -d"." -f1 )
    bash test_ann.sh val/svm/color.svm val/ann/$line > val/svm/color_$ann.svm

done