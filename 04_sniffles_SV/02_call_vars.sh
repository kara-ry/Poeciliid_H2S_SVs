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

sniffles --input bc1018_pmex_scaffold_sorted.bam --snf bc1018_pmex_scaffold_sorted_sniffles.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta
sniffles --input bc1020_pmex_scaffold_sorted.bam --snf bc1020_pmex_scaffold_sorted_sniffles.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta
sniffles --input bc2031_pmex_scaffold_sorted.bam --snf bc2031_pmex_scaffold_sorted_sniffles.snf --threads 8 --reference Pmex_NS.ragtag.scaffold.fasta

sniffles --input bc1018_pmex_scaffold_sorted_sniffles.snf bc1020_pmex_scaffold_sorted_sniffles.snf bc2031_pmex_scaffold_sorted_sniffles.snf \
--vcf Pmex_NS.ragtag.scaffold.multisample.hifi.vcf
# python3 sniffles2_plots.py -i bc1018_reads_to_primary_sorted_sniffles.vcf -o bc1018_reads_to_primary_sorted_sniffles_plot
