#/bin/bash


list=$1
input=$2 $inputdir
dir=$3 #output path of csv, also the header in result
result="/mnt/data6t/QsComp/result.csv"
path1="/mnt/data1t/QsComp/dataset/vcf"
path2="/mnt/data1t/QsComp/dataset/vcf2"
mkdir $dir

while read ref file; do
	name="${file##*/}"
        name="${name%.*}"
	echo $name
	echo "$dir $name" >> $result
	echo "Type,Filter,Precision,Recall, NaN fraction,F-score" >> $result
	python2.7 /mnt/data1t/QsComp/dataset/hap.py/bin/hap.py ${path2}/${name}.vcf.gz ${input}/${name}.vcf.gz \
        -r ${ref} -f ${path1}/${name}.bed -o ${dir}/${name}
	#echo "python2.7 /mnt/data1t/QsComp/dataset/hap.py/bin/hap.py ${path}/${name}.vcf.gz ${input}/${name}.vcf.gz -force-interactive -r  ${ref} -f ${path}/${name}.bed -o ${dir}/${name}"
	{
		read
		while IFS=, read -r  a b c d e f g h i j k l m n o; do
		#echo "precision $k, recall $l, Na fraction $m, F-score $n"
		#echo "next"
		echo "$a,$b,$k,$l,$m,$n " >> $result
		done
	} <  "${dir}/${name}.summary.csv"
	echo "" >> $result
done <$1


#{
#    read
#    while IFS=, read -r accountId ProductId Product
#    do 
#        echo "Account $accountId has productId $ProductId and product $Product"
#    done
#} < $filename
