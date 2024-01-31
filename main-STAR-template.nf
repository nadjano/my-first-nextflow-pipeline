#!/usr/bin/env nextflow
params.genomeFasta = "$baseDir/test_RNA_seq/ggal_1_48850000_49020000.Ggal71.500bpflank.fa"

// Define output dir
params.publish_dir="$baseDir/results"

// from Path
genomeFasta = Channel.fromPath(params.genomeFasta)

// from File Pairs
fastqFiles = Channel
    .fromFilePairs('./test_RNA_seq/ggal_gut_{1,2}.fq')


// Flatten Channel
fastqFiles_flat = fastqFiles.map { it ->
    it.flatten()
    }

//--------  view fastqFiles_flat


/*
 * Create STAR index for genome
 */
process build_STAR_index {

    conda "envs/STAR.yaml"
 
    input:
    path(genomeFasta)
 
    output:
    // -------- Add output channel (Which dir is the index?)
    
    script:
    """
    STAR --runThreadN 1  \
         --runMode genomeGenerate \
         --genomeDir STAR_index \
         --genomeFastaFiles $genomeFasta
    """
}

/*
 * Map reads to genome
 */
process run_STAR_alignment {

    conda // -------- Which environment do we need?

    publishDir(
        path: "${params.publish_dir}/STAR_quant",
    )
 
    input:
        tuple path(STAR_index), val(sample_name), path(read1), path(read2)
 
    output:
        tuple val(sample_name), path("$sample_name")
        
    
    script:
    """
    STAR  --genomeDir STAR_index \
          --readFilesIn #------------What goes here? \
          --outFileNamePrefix $sample_name/ \
          --outSAMtype BAM SortedByCoordinate
    """
}
 

/*
 * Define the workflow
 */
workflow {

    star_index = build_STAR_index(genomeFasta)

    index_with_reads = star_index.combine(fastqFiles_flat)

    index_with_reads.view()
    // ----------add step to run alignment

}