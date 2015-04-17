#!/bin/sh
for f in 'train' 'val'
do
	echo "Création du dossier $f"
	rm -R $f/ssvm
	mkdir $f/ssvm

	for sift in $(ls $f/sift/1nn/*.sift); do

	    echo "Traitrement de $sift pour la collection $f ..."

		name=$( basename $sift )

		for i in `seq 0 256`; do
		    v[$i]=0;
	    done

		for line in $(cat $sift); do
			v[$line]=$((v[$line] + 1))
		done
		
		echo -n "0" >> "$f/ssvm/sift.svm"

		lineNum=$( cat $sift | wc -l )

		for i in `seq 0 256`; do
			if [ $[v[$i]] -ne "0" ]
			then
				val=$(echo "scale=6 ;$[v[$i]]/$lineNum" | bc)
				echo -n " $i:0$val" >> "$f/ssvm/sift.svm"
			fi
		done

		echo "" >> "$f/ssvm/sift.svm"
	done
done
