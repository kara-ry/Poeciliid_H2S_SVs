#!/bin/bash
#SBATCH --job-name=sniffles
#SBATCH --output=out/%x_%j.out
#SBATCH --error=err/%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kamaryan@ucsc.edu
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4G

conda activate sniffles2

sniffles --input Psulph.bam --snf Psulph.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta
sniffles --input Pmex_S.bam --snf Pmex_S.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta
sniffles --input Pmex_NS.bam --snf Pmex_NS.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta

sniffles --input Psulph.snf Pmex_S.snf Pmex_NS.snf \
--vcf Pmex_NS.ragtag.scaffold.multisample.hifi.vcf
# python3 sniffles2_plots.py -i bc1018_reads_to_primary_sorted_sniffles.vcf -o bc1018_reads_to_primary_sorted_sniffles_plot
