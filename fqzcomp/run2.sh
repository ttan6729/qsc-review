#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result_q3"
        output="${dir}/${name}.fqz"
        /usr/bin/time -v ./fqzcomp -s5 -q3 ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./fqzcomp -d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

