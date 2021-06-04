#!/bin/bash
#first is referece list,  secound is dir of input. third is the output dir
list=$1
input=$2
dir=$3
mkdir $dir

bwa="/home/ubuntu/QsComp/tool/bwa-0.7.17/bwa"
sam="/home/ubuntu/QsComp/tool/samtools/samtools"
while read ref file; do
	index="${ref##*/}"
	index="${index%.*}"
        name="${file##*/}"
        name="${name%.*}"
	echo "input: $ref $input/${name}.fastq"
	hisat2 /mnt/data1t/QsComp/dataset/index2/${index} -U ${input}/${file} -S ${dir}/${name}.sam
	${sam} sort ${dir}/${name}.sam > ${dir}/${name}.bam
	#echo " ${sam} mpileup -uf $ref ${dir}/${name}.bam | bcftools view -bvcg - >  ${dir}/${name}.bcf"
	#${sam} mpileup -uf $ref ${dir}/${name}.bam | bcftools view -bvcg - >  ${dir}/${name}.bcf
	bcftools mpileup -f $ref ${dir}/${name}.bam | bcftools call -mv -Ob -o ${dir}/${name}.bcf
	bcftools view ${dir}/${name}.bcf -O z -o  ${dir}/${name}.vcf.gz
	rm ${dir}/*sam
done <$1


