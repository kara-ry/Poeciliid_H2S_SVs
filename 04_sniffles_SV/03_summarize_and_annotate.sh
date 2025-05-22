cat your_file.vcf | grep -v '^#' | grep -o 'GENE=[^;]*' | sed 's/GENE=//' | sort | uniq -c | sort -nr
