#!/bin/bash
#first is referece list,  secound is dir of input. third is the output dir
list=$1
input=$2
dir=$3
mkdir $dir

bwa="/home/ubuntu/QsComp/tool/bwa-0.7.17/bwa"
sam="/home/ubuntu/QsComp/tool/samtools/samtools"

while read ref file; do
        name="${file##*/}"
        name="${name%.*}"
	echo "input: $ref $input/${name}.fastq"
	${bwa} mem  $ref ${input}/${name}.fastq > ${dir}/${name}.sam
	${sam} sort ${dir}/${name}.sam > ${dir}/${name}.bam
	gatk --java-options "-Xmx4g" AddOrReplaceReadGroups -I ${dir}/${name}.bam -O ${dir}/${name}.RG.bam \
	-RGID 4 -RGLB lib1  -RGPL ILLUMINA -RGPU unit1  -RGSM 20
	${sam} index ${dir}/${name}.RG.bam
	gatk --java-options "-Xmx4g" HaplotypeCaller -R ${ref} -I ${dir}/${name}.RG.bam -O  ${dir}/${name}.vcf.gz
done <$1

rm ${dir}/*RG.bam
rm ${dir}/*sam
