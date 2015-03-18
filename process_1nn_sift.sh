#!/bin/sh

# Génération pour train et val ensemble
for folder in 'train' 'val'
do
	rm -R `$folder`/sift/1nn/
	mkdir `$folder`/sift/1nn/
	for f in /u/m/mulhemp/sift/`$folder`/*.sift
	do
	  echo "Traitrement de $f"
	  sed -n '4,$p' $f | tr -d ";" | sed 's/<CIRCLE [1-9].*> //' > ./trav.sift
	  R --slave --no-save --no-restore --no-environ --args centers256.txt 256 ./trav.sift ./res.sift < 1nn.R
	  mv ./res.sift `$folder`/sift/1nn/`basename $f`
	done

	\rm -f ./trav.sift ./res.sift
done
