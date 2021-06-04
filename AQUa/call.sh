#!/bin/bash

ref=$1
file=$2

dir="vcf"
mkdir $dir

name="${file##*/}"
name="${name%.*}"

bwa mem  $ref $file | samtools view -F4 -h -Obam -o ${dir}/${name}.bam
gatk -T RealignerTargetCreator -R $ref -I ${dir}/${name}.bam -o ${dir}/${name}.list
gatk -T IndelRealigner -R $ref -I ${dir}/${name}.bam  -targetIntervals ${dir}/${name}.list -o \
${dir}/${name}_realign.bam
gatk -T HaplotypeCaller -R  $ref -I ${dir}/${name}_realign.bam -gt_mode DISCOVERY \
-stand_emit_conf 3 -stand_call_conf 10 -GQB 10 -GQB 20 -GQB 30 -GQB 40 -GQB 50 \
--variant_index_type LINEAR --variant_index_parameter 128000 -o /dev/stdout \
> ${dir}/${name}.vcf
