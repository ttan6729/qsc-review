#!/bin/bash

dir1="result0"
dir2="result30"

while read file; do
	name="${file##*/}"
	name="${name%.*}"
	output="${dir1}/${name}"
	/usr/bin/time -v ./scalce $file  -o $output
	echo "input: $file"
	/usr/bin/time -v ./scalce -d ${output}_1.scalcen -o ${dir1}/${name}
	echo "input: $output"
	#rm ${dir1}/*.fastq
done <$1

