#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        name="${name%.*}"
	dir="result"
        output="${dir}/${name}.bin"

	line="inputfile=${file}"
	sed -i "2s@.*@$line@" config_encode_qual.properties
	line="outputfile=${output}"
	sed -i "5s@.*@$line@" config_encode_qual.properties
	n=$(wc -l < "$file")
	line="inputsize=$n"
	sed -i "19s@.*@$line@" config_encode_qual.properties

        /usr/bin/time -v java -jar AQUa.jar config_encode_qual.properties
        echo "input: $file"

        line="inputfile=${output}"
        sed -i "2s@.*@$line@" config_decode.properties
        line="outputfile=${dir}/${name}.fastq"
        sed -i "4s@.*@$line@" config_decode.properties
        line="inputsize=$n"
        sed -i "16s@.*@$line@" config_decode.properties

	/usr/bin/time -v java -jar AQUa.jar config_decode.properties

        #echo "input: $output"
done <$1

