#!/bin/bash

echo "Traitement du fichier top :"
if [ -f fusion_top/fusion_all.top ];then
	rm fusion_top/fusion_all.top
fi

cat fusion_top/fusion*.top > fusion_top/fusion_all.top
./libsvm/trec_eval -q -m map val/rel/all.rel fusion_top/fusion_all.top

for name in $(cat concepts.txt); do
	
	echo "Traitement de $name: "

	./libsvm/trec_eval -q -m map val/rel/$name.rel fusion_top/fusion_$name.top

	echo ""

done
