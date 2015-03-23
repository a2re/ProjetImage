#!/bin/bash

echo "Traitement du fichier top :"
./libsvm/trec_eval -q -m map val/rel/all.rel top/color_all.top

for name in $(cat concepts.txt); do
	
	echo "Traitement de $name: "

	./libsvm/trec_eval -q -m map val/rel/$name.rel top/color_$name.top

	echo ""

done
