#!/bin/bash
#SBATCH --job-name=vg_index
#SBATCH --time=4-00:00:00
#SBATCH --output=out/index_%j.out # output file
#SBATCH --error=err/index_%j.err # error file
#SBATCH --cpus-per-task=12
#SBATCH --mem=128GB
#SBATCH --mail-user=kamaryan@ucsc.edu         ### email address
#SBATCH --mail-type=BEGIN,END,FAIL

./vg autoindex --workflow lr-giraffe \
--prefix vg_index_out --gfa Poecilia_panSN-spec_merged.fa.b31ee30.417fcdf.b777c94.smooth.final.gfa
