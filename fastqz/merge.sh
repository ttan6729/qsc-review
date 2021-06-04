
#!/bin/bash

#q0 lossless compression
while read file; do
        name="${file##*/}"
        #name="${name%.*}"
	./merge $file result_q5/${name} result_q5b/${name}
#	./merge $file result_q3/${name} result_q3b/${name}
done <$1



