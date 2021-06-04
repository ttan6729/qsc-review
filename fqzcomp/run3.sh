#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result_q0"
        output="${dir}/${name}.fqz"
        /usr/bin/time -v ./fqzcomp -s5 -q0 ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./fqzcomp -d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

