#!/bin/sh

#bash test.sh train/svm/color.svm train/ann/aeroplane.ann > train/svm/color_aeroplane.svm

exec 6< $1
while read -r line
do
	read -r f2line <&6

	index=$( echo ${line} | cut -d" " -f2- )
	note=$( echo ${f2line} | cut -d" " -f2- )

	if [ "$index" -ne "0" ]; then
		echo -e "${index} ${note}"
	fi
done <$2