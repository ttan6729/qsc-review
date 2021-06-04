#!/bin/bash
#first is referece list,  secound is dir of input. third is the output dir
list=$1
input=$2
dir=$3
mkdir $dir
index_path="/mnt/data1t/QsComp/dataset/index3"
bwa="/home/ubuntu/QsComp/tool/bwa-0.7.17/bwa"
sam="/home/ubuntu/QsComp/tool/samtools/samtools"

while read ref file; do
	ref_name="${ref##*/}"
	ref_name="${ref_name%.*}"
        name="${file##*/}"
        name="${name%.*}"
	echo "input: $ref $input/${name}.fastq"
	/mnt/data1t/QsComp/dataset/STAR/source/STAR --genomeDir ${index_path}/${ref_name} \
	--runThreadN 6 \
	--readFilesIn ${input}/${file} \
	--outFileNamePrefix ${dir}/${name} \
	--outSAMtype BAM SortedByCoordinate \
	--outSAMunmapped Within \
	--outSAMattributes Standard
	#echo " ${sam} mpileup -uf $ref ${dir}/${name}.bam | bcftools view -bvcg - >  ${dir}/${name}.bcf"
	#${sam} mpileup -uf $ref ${dir}/${name}.bam | bcftools view -bvcg - >  ${dir}/${name}.bcf
	bcftools mpileup -f $ref ${dir}/${name}Aligned.sortedByCoord.out.bam | bcftools call -mv -Ob -o ${dir}/${name}.bcf
	bcftools view ${dir}/${name}.bcf -O z -o  ${dir}/${name}.vcf.gz
	#rm ${dir}/*sam
done <$1


