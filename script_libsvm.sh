#!/bin/sh
for var in $(cat $1); do
    ./read_image $var
done