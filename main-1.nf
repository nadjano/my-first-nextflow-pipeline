#!/usr/bin/env nextflow
 
log.info """\
         My first nextflow pipeline   
         ===================================
         Hello ${params.name}!
         """
         .stripIndent()

params.in = "$baseDir/data/text.txt"
 
/*
 * return content of File to stdout
 */
process catFile {
 
    input:
    path(file)
 
    output:
    stdout
    
    script:
    """
    cat $file 
    """
}
 
/*
 * Define the workflow
 */
workflow {
    output = catFile(params.in)
    output.view()
}
