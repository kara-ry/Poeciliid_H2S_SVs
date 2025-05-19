#!/bin/bash
#SBATCH --job-name=pggb
#SBATCH --time=4-00:00:00
#SBATCH --output=out/pggb_%j.out # output file
#SBATCH --error=err/pggb_%j.err # error file
#SBATCH --cpus-per-task=36
#SBATCH --mem=72GB

# conda activate pggb
module load bcftools vg

# Ensure the script finds dependencies
export PATH="$HOME/.conda/envs/pggb/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.conda/envs/pggb/lib:$LD_LIBRARY_PATH"

pggb \
    -i Poecilia_panSN-spec_merged.fa -n 7 \
    -o Poecilia_panSN-spec_merged_out \
    -t 36 \
    -p 98 \
    -s 10000 \
    -V 'Pmex_ref:100000'
