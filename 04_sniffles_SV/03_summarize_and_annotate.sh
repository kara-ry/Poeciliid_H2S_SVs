cat your_file.vcf | grep -v '^#' | grep -o 'GENE=[^;]*' | sed 's/GENE=//' | sort | uniq -c | sort -nr


bedtool intersect -a ${1}.vcf -b ${2}.bed > $3

samtools view input.bam "NC_024348.1_RagTag:27837471-27944631" > output.bam

samtools view input.bam "NC_024348.1_RagTag:27827471-27954631" > output.bam
