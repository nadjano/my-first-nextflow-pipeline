# Introduction

# Why to use nextflow?

1. Reproducible Pipelines: create pipelines that can be easily found, accessed, used with other systems, and reused. This follows the FAIR guidelines.
2. Version Control and Containers: Nextflow supports these features to manage software dependencies effectively.
3. Portability: Pipelines created on a laptop can be easily scaled up to run on high-performance clusters or various cloud platforms like AWS, Azure, Google Cloud, or Kubernetes. Nextflow ensures your code works well in different environments.
4. Scalability: Nextflow can handle large-scale tasks by running many processes in parallel, without being tied to a specific platform or service.
5. Flexibility: It's designed to meet various scientific workflow needs, like saving time on repeated calculations and providing detailed reports on your workflows.
6. Growing and Supportive Community: Since its start in 2013, Nextflow has been growing quickly. It has a strong community of developers and support from Seqera Labs.
7. Open Source: Nextflow is free to use, modify, and distribute under the Apache 2.0 license.

# What we will learn

- Simple Worklflow
- Channels
- Workflow for RNA-seq


- Debugging
- channel factory 
- tuple 



# Presentation
- Why tp use nextflow?



### Basic structure 



# Simple example

![Alt text](example-1.png)


How to run:

'''
nextflow run main-1.nf --name [your name here]
'''

# Channels

``````
// Channel.of create channel 
bases = Channel.of('A', 'C', 'G', 'T')
bases.view()
``````
```{r df-drop-ok, class.source="bg-success"}
A
C
G
T
```



# Nextflow or snakemake?

Key Differences
### Scripting Language: 
Nextflow uses a Groovy-based DSL, while Snakemake uses Python.
### Execution Philosophy: 
Nextflow is data-driven, focusing on the flow of data, whereas Snakemake is rule-driven, focusing on file transformation rules.
### Community and Ecosystem: 
Nextflow might have a broader appeal across various computing environments, while Snakemake is particularly favored in Python-centric communities.
