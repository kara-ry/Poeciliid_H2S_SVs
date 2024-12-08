#!/bin/bash
#SBATCH --job-name=hifi_qc
#SBATCH --output=out/%x_%j.out
#SBATCH --error=err/%x_%j.err
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=20GB

module load fastqc

output=/weka/data/lab/kelley/projects/pmex/hybrids/hifi_genomes/01_qc/fastqc_out

for file in /weka/data/lab/kelley/projects/rawdata/pmex/pmex_hifi_genomes/bams/*.bam
do
fastqc -t 8 -o fastqc_out $file
done
