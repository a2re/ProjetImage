#!/bin/sh
for f in 'train' 'val'
do
	echo "Création du dossier $f"
	rm -R $f/hist
	mkdir $f/hist

	for sift in $(ls $f/sift/1nn/*.sift); do

	    echo "Traitrement de $sift"

		name=$( basename $sift )

		for i in `seq 0 255`; do
		    v[$i]=0;
	    done

		for line in $(cat $sift); do
			v[$line]=$((v[$line] + 1))
		done

		output=$(echo $name | cut -d "." -f 1)
		for i in `seq 0 255`; do
			if [ $[v[$i]] -ne "0" ]
			then
				echo $[ v[$i] ] >> "$f/hist/$output.hist"
			fi
		done
	done
done