#!/bin/bash

mkdir five
for d in {1..5}; do
    mkdir "five/dir$d"
    for k in {1..4}; do
	file=five/dir$d/file$k
	for i in $(seq 1 $k); do
	    echo $k >> $file
	done
    done
done

