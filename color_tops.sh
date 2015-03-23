#!/bin/sh

rm -R top
mkdir top

for name in $(cat concepts.txt); do

	echo "Traitemenet de $name : "
    bash test_top.sh val/ann/$name.ann out/color_$name.out > top/color_$name.top

done

cat val/top/color*.top > top/color_all.top
