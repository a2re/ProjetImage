#!/bin/sh
annofile=$1
filename=$2 
i=0


get_annotation () {
count=0 
for line in `cat $1`; do
          
     if [ $count == $2 ]
     then
    	 echo "$line"
     fi      
     count=$(($count+1))
done
}

for line in `cat $annofile`; do
     val=`expr $i % 2`
     
     if [ $val == 1 ]
     then
    	 echo "$line"
     fi      
     i=$(($i+1))

done > annotation.txt


count=0
for line in `cat $filename`; do
     echo "$line \n"
     val=$(get_annotation "annotation.txt" $count)	
     res=$(./read_image $line)
    
     echo "$val$res">>train/color_aeroplane.svm
     count=$(($count+1))
done

rm annotation.txt

