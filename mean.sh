#!/bin/bash
if [ $# -lt 1 ]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column=$1

file=${2:-/dev/stdin}
cut -d, -f"$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read val; do
sum=$(echo "$sum + $val" | bc)
        count=$((count + 1))
    done
if [ $count -gt 0 ]; then
        echo "scale=2; $sum / $count" | bc
    fi
}


