#!/bin/bash

function fusion()
{
	local FD1=7
	local FD2=8
	local file1=$1
	local file2=$2
	local count1=0
	local count2=0
	local eof1=0
	local eof2=0
	local line1
	local line2


	exec 7<$file1
	exec 8<$file2

	while [[ $eof1 -eq 0  ||  $eof2 -eq 0 ]]
	do
		if read line1 <&$FD1; then
			score1=$(echo $line1 | cut -d ' ' -f5)
			if [[ $score1 == *"e-"* ]]
			then 
				score1="0"
			fi
		else
			eof1=1
		fi
		if read line2 <&$FD2; then			
			score2=$(echo $line2 | cut -d ' ' -f5)
			if [[ $score2 == *"e-"* ]]
			then 
				score2="0"
			fi
			score=$(echo "scale=6 ; $score1+$score2" | bc ) 
			score_fusion=$(echo "scale=6;$score/2" | bc ) 
			line=$(echo $line2 | sed "s/ $score2 R//g")
			echo "$line 0$score_fusion R"
		else
			eof2=1
		fi
	done
}
mkdir fusion_top
for name in $(cat concepts.txt); do
	echo "Reading color_$name.top and sift_$name.top"
	fusion top/color_$name.top sift_top/sift_$name.top >> fusion_top/fusion_$name.top	
done 

#fusion top/color_cat.top sift_top/sift_cat.top

