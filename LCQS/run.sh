#!/bin/bash

while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="result/${name}.comp"
        /usr/bin/time -v ./lcqs c $file $output
        echo "input: $file"
        /usr/bin/time -v ./lcqs d $output result/${name}.decomp
        echo "input: $output"
done <$1

