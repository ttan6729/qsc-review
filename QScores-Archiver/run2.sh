#!/bin/bash

while read file; do
        name="${file##*/}"
        name="${name%.*}"
        output="result_logbin/${name}.bin"
        /usr/bin/time -v ./qscores --encode --input $file --output $output  --binary --verbose --logbin 5
        echo "input: $file"
        /usr/bin/time -v ./qscores --decode --input $output --output result_logbin/${name}.decomp  --binary --verbose
        echo "input: $output"
done <$1

