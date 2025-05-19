import sys
import re

def rename_fasta_headers(input_fasta, output_fasta, sample_name, haplotype_id, delimiter="#"):
    with open(input_fasta, "r") as infile, open(output_fasta, "w") as outfile:
        for line in infile:
            if line.startswith(">"):
                contig_name = line.strip()[1:]  # Remove '>'
                new_header = f">{sample_name}{delimiter}{haplotype_id}{delimiter}{contig_name}\n"
                outfile.write(new_header)
            else:
                outfile.write(line)

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python rename_fasta.py <input_fasta> <output_fasta> <sample_name> <haplotype_id>")
        sys.exit(1)

    input_fasta = sys.argv[1]
    output_fasta = sys.argv[2]
    sample_name = sys.argv[3]
    haplotype_id = sys.argv[4]

    rename_fasta_headers(input_fasta, output_fasta, sample_name, haplotype_id)
