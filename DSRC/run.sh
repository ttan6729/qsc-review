#!/bin/bash

#q0 lossless compression
dir="result_q0"
mkdir $dir
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	output="${dir}/${name}.dsrc"
        /usr/bin/time -v ./dsrc c -q0  ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./dsrc d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

dir="result_q2"
mkdir $dir
while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir}/${name}.dsrc"
        /usr/bin/time -v ./dsrc c -q2  ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./dsrc d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

dir="result_lq0"
mkdir $dir
while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir}/${name}.dsrc"
        /usr/bin/time -v ./dsrc c -q0 -l ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./dsrc d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

dir="result_lq2"
mkdir $dir
while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir}/${name}.dsrc"
        /usr/bin/time -v ./dsrc c -q2 -l ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./dsrc d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

