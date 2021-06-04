#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result"
        output="${dir}/${name}.fqz"
        /usr/bin/time -v ./genie run -i $file -o ${dir}/${name}.mgrec
        echo "input: $file"
        /usr/bin/time -v ./genie run -i ${dir}/${name}.mgrec -o ${dir}/${name}.fastq
        echo "input: $output"
done <$1

