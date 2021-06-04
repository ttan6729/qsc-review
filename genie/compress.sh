#!/bin/bash

file=$1
name="${file##*/}"
name="${name%.*}"
dir="result"

./genie $file --generate --config-dir  ${dir}/${name}
./genie $file --config-dir  ${dir}/${name} ${dir}/${name}.genie
