#!/bin/bash

echo "Traitement du fichier top :"
./libsvm/trec_eval -q -m map val/rel/all.rel sift_top/sift_all.top

for name in $(cat concepts.txt); do
	
	echo "Traitement de $name: "

	./libsvm/trec_eval -q -m map val/rel/$name.rel sift_top/sift_$name.top

	echo ""

done
