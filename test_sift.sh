#!/bin/bash

tail -n +4 "/home/m/mulhemp/sift/train/$1" | cut -d";" -f2 | cut -d" " -f2- > "train/sift/$1.tmp"

i=75
while read line
do  
	if (( $i == 75 )); then
		echo $line >> "train/sift/$1"
		i=1
	else
		i=$(( $i + 1 ))		
	fi
done < "train/sift/$1.tmp"

rm -f "train/sift/$1.tmp"
