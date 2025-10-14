#!/bin/bash

for d in */; do
    echo -n "$d : "
    grep -rio "Location" "$d" | wc -l
done    
