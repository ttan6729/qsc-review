#!/bin/bash

dir2="result30"


while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="${dir2}/${name}"
#        /usr/bin/time -v ./scalce $file  -o $output -p 0
#       echo "input: $file"
        /usr/bin/time -v ./scalce -d ${output}_1.scalcen -o ${dir2}/${name}.fastq
        echo "input: $output"
        #rm ${dir2}/*.fastq
done <$1
