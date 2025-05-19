#!/bin/bash
#SBATCH --job-name=vg_gir_highmem
#SBATCH --time=4-00:00:00
#SBATCH --output=out/gir_%j.out # output file
#SBATCH --error=err/gir_%j.err # error file
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=12GB
#SBATCH --mail-user=kamaryan@ucsc.edu         ### email address
#SBATCH --mail-type=BEGIN,END,FAIL

./vg giraffe -b hifi -Z vg_index_out.giraffe.gbz -f $1 \
-p >${2}_hifi_mapped_to_pan.gam

./vg stats -a ${2}_hifi_mapped_to_pan.gam > ${2}_hifi_mapped_to_pan.stats
