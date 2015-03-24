#!/bin/sh

rm -R sift_top
mkdir sift_top

for name in $(cat concepts.txt); do

	echo "Traitemenet de $name : "
    bash test_top.sh val/ann/$name.ann sift_out/sift_$name.out > sift_top/sift_$name.top

done

cat sift_top/sift*.top > sift_top/sift_all.top
