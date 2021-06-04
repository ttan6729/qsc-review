#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result"
        output="${dir}/${name}.qvz"
        /usr/bin/time -v ./qvz -q ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./qvz -x ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

