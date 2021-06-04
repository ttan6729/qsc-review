#!/bin/bash

#q0 lossless compression
dir="result_lossy"
while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir}/${name}.fqz"
        /usr/bin/time -v ./leon -file $file -c
	mv ${file}.leon ${dir}/${name}.leon
        echo "input: $file"
        /usr/bin/time -v ./leon -file ${dir}/${name}.leon -d
        echo "input: $output"
done <$1

dir="result_lossless"
while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir}/${name}.fqz"
        /usr/bin/time -v ./leon -file $file -c  -lossless
        mv ${file}.leon ${dir}/${name}.leon
        echo "input: $file"
        /usr/bin/time -v ./leon -file ${dir}/${name}.leon -d
        echo "input: $output"
done <$1

