cat your_file.vcf | grep -v '^#' | grep -o 'GENE=[^;]*' | sed 's/GENE=//' | sort | uniq -c | sort -nr


bedtool intersect -a ${1}.vcf -b ${2}.bed > $3

