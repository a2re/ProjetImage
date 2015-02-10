#!/bin/sh
filename=$2 
search_dir=$1


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
ls $search_dir | grep '.ann' | sed 's/.ann//g' > anno_name.txt 

for annofile in `cat anno_name.txt`; do
	for line in `cat search_dir/$annofile.ann`; do
	     val=`expr $i % 2`
	     
	     if [ $val == 1 ]
	     then
	    	 echo "$line"
	     fi      
	     i=$(($i+1))

	done > temp/$annofile.txt
done


count=0
for line in `cat $filename`; do
     echo "$line \n"
     
     res=$(./read_image $line)
     for annofile in `cat anno_name.txt`; do
	val=$(get_annotation "temp/$annofile.txt" $count)	
	echo "$val$res">>train/color_$annofile.svm
	
     done
     count=$(($count+1))
done



