#!/usr/bin/env nextflow
/* 
 * 
 */

log.info """\
         My first nextflow pipeline   
         ===================================
         Hello ${params.name}!
         """
         .stripIndent()

// import processes from modules
// include { extract_mRNA; generate_expression_matrix; simulate_lrRNA; run_css } from './Modules/lrReads_simulation'
// include { quantification; isoform_collaps } from './Modules/Mapping'
// include { run_IsoPhase } from './Modules/IsoPhase'
// include { run_freeBayes; run_whatsHap; run_whatsHap_tag } from './Modules/WhatsHap'

 
params.in = "$baseDir/data/sample.fa"
 
/*
 * Split a fasta file into multiple files
 */
process splitSequences {
 
    input:
    path 'input.fa'
 
    output:
    path 'seq_*'
 
    """
    awk '/^>/{f="seq_"++d} {print > f}' < input.fa
    """
}
 
/*
 * Reverse the sequences
 */
process reverse {
 
    input:
    path x
 
    output:
    stdout
 
    """
    cat $x | rev
    """
}
 
/*
 * Define the workflow
 */
workflow {
    splitSequences(params.in) \
      | reverse
      | view
}
