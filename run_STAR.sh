#!/bin/bash
# Define variables
PROJ=/Users/nadjanolte/NIB/my-first-nextflow-pipeline

GENOME_FASTA=$PROJ/test_RNA_seq/ggal_1_48850000_49020000.Ggal71.500bpflank.fa

$GENOMEDIR=STAR_index

file1=$PROJ/test_RNA_seq/ggal_gut_1.fq
file2=$PROJ/test_RNA_seq/ggal_gut_2.fq

# activate STAR conda env
conda activate STAR

# Create index for alignment
STAR --runThreadN 23  \
     --runMode genomeGenerate \
    --genomeDir STAR_index \
    --genomeFastaFiles $GENOME_FASTA

# Map files to index
STAR  --genomeDir STAR_index \
      --readFilesIn $file1 $file2