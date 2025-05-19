#!/bin/bash
#SBATCH --job-name=map_hifi
#SBATCH --output=out/minimap_%x_%j.out
#SBATCH --error=err/minimap_%x_%j.err
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=4G

conda activate minimap2
# general useage of minimap
# minimap2 -ax map-hifi ref.fa pacbio-ccs.fq.gz > aln.sam

minimap2 -ax map-hifi $1 $2 > ${3}.sam

samtools sort ${3}.sam -o ${3}_sorted.bam

samtools index ${3}_sorted.bam
