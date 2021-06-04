
#!/bin/bash

#q0 lossless compression
#while read file; do
#        name="${file##*/}"
#        name="${name%.*}"
#        dir="result_q1"  #lossless
#        output="${dir}/${name}"
#        /usr/bin/time -v ./fastqz c1 ${file} ${output}
#        echo "input: $file"
#        /usr/bin/time -v ./fastqz d ${output}  ${dir}/${name}.fastq
#        echo "input: $output"
#done <$1


while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result_q3"
        output="${dir}/${name}"
        /usr/bin/time -v ./fastqz c3 ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./fastqz d ${output}  ${dir}/${name}.fastq
        echo "input: $output"
done <$1

while read file; do
        name="${file##*/}"
        name="${name%.*}"
        dir="result_q5"
        output="${dir}/${name}"
        /usr/bin/time -v ./fastqz c5  ${file} ${output}
        echo "input: $file"
        /usr/bin/time -v ./fastqz d ${output} ${dir}/${name}.fastq
        echo "input: $output"
done <$1

