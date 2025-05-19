#!/bin/bash
#SBATCH --job-name=rename
#SBATCH --time=4-00:00:00
#SBATCH --output=out/rename_%j.out # output file
#SBATCH --error=err/rename_%j.err # error file
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB

# input fasta, output fasta, sample id, haplotype number
python rename_fasta_header_for_PanSN-spec.py ${1}.bp.hap${2}.p_ctg.fa ${1}_hap${2}_panSN-spec.fasta \
${1} ${2}
