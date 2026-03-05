#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d',' -f7 | {
    sum=0
    n=0
    while read value; do
	sum=$(($sum + $value))
	n=$(($n+1))
    done
    avg=$(($sum/$n))
    echo $avg
    }
