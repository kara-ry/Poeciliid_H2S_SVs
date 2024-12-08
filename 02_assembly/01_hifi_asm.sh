#!/bin/bash
#SBATCH --job-name=extract_fq
#SBATCH --output=out/%x_%j.out
#SBATCH --error=err/%x_%j.err
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=4GB

module load bedtools hifiasm

bedtools bamtofastq -i $1 -fq fastq/${2}

hifiasm -o ${1}/${2}.asm -t 24 fastq/${2}.fq
