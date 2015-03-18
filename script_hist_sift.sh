#!/bin/sh

rm -R train/hist
mkdir train/hist

for sift in $(ls train/sift/1nn/*.sift); do

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
			echo $[ v[$i] ] >> "train/hist/$output.svm"
		fi
	done
done

# Création des val
rm -R val/hist
mkdir val/hist

for sift in $(ls val/sift/1nn/*.sift); do

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
			echo $[ v[$i] ] >> "val/hist/$output.svm"
		fi
	done
done
