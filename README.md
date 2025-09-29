
# Code Compilation for Bioinformatics Projects at IHA

Welcome to this repository! This collection showcases the codes and scripts used for various bioinformatics projects at the Institute for Advancing Health Through Agriculture (IHA), Texas A&M AgriLife Research, College Station, TX. The repository includes scripts for both RNA-Seq and DNA mapping analysis.

Here's what you'll find:
- **README file**
- **Script documentation:**
    - *DNA Mapping Pipeline.md*
    - *RNA Mapping Pipeline.md*
    - *TAMU_HPRC.md*
- **Scripts:**
    - *Preprocessing:*
        - fastqc_terrra.slurm (Quality check of raw reads)
        - trimmomatic_loop_terra.slurm (Trimming reads)
        - trimmomatic_terra.slurm (Trimming reads, alternative script)
    - *Alignment:*
        - ref_genome_index_star_terra.slurm (Indexing reference genome)
        - mapping_reads_indexed_ref_genome.slurm (Mapping reads to reference genome, for RNA-Seq)
        - run_bwa_0.7.17_samtools_1.9_sort_pe_terra.sh (DNA mapping)
          
    - *Counting reads*
        - script_salmon_quantifying.slurm (RNA-Seq)
        - script_salmon_indexing.slurm (RNA-Seq)
        - tpmcalculator.slurm (RNA-Seq)
        - script_counting_STAR_summary (RNA-Seq)
   
    - *Analysis:*
        - script_processing_STAR_output_files.R (RNA-Seq analysis)
        - script_processing_TPMCalculator_output_files.R (RNA-Seq analysis)
        - script_merging_Salmon_TPMCal_res_file_correlation.R (RNA-Seq analysis)
        - 
  
## Languages Used

- Bash
- R

This repository provides a central location for bioinformatics scripts used at IHA, covering both RNA-Seq and DNA-Seq workflows. The scripts are designed for execution on the TAMU HPRC cluster and include detailed documentation.
