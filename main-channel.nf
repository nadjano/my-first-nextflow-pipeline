#!/usr/bin/env nextflow
 
log.info """\
         Channels
         ===================================
         """
        
// Define parameters
params.in = "$baseDir/data/text.txt"

// Define input Channels
// Channel.of create channel 
bases = Channel.of('A', 'C', 'G', 'T')
bases.view()

// Chreate Channel from File
test_file = Channel.fromPath("$baseDir/data/*.txt")
test_file.view()





// Combine Channles
println('.combine')
test_file.combine(bases).view()
println('--------')

// concat Channels
println('.concat')
test_file.concat(bases).view()
println('--------')




