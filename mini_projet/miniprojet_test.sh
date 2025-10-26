#!/bin/bash
if [ $# -eq 0 ]; then
    echo "ERREUR"
    exit 1
fi

file=$1 
n=0

cat "$" | while read -r line; do
    n=$((n + 1))
    echo -e "${n}\t${line}"
done

