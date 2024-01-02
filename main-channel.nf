#!/usr/bin/env nextflow
 
log.info """\
         Channels
         ===================================
         """
        


// Define input Channels
// Channel.of create channel 
bases = Channel.of('A', 'C', 'G', 'T')
bases.view()

numbers = Channel.of(1, 2)

// Combine
numbers_bases = numbers.combine(bases)
numbers_bases.view()







