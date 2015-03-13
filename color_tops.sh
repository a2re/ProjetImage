#!/bin/sh
mkdir val/top
for line in $(ls val/ann); do

    name=$( echo $line | cut -d"." -f1 )

    bash test_top.sh val/ann/$name.ann val/out/color_$name.out > val/top/color_$name.top

done
