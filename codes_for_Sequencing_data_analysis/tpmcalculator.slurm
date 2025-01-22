#!/bin/bash
#SBATCH --export=NONE               # do not export current env to the job
#SBATCH --job-name=tpmcalculator       # job name
#SBATCH --time=24:00:00             # max job run time dd-hh:mm:ss
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=8           # CPUs (threads) per command
#SBATCH --mem=200G                    # total memory per node
#SBATCH --output=/scratch/user/farid-bge/stdout/stdout_tpmcalculation.%j      # save stdout to file
#SBATCH --error=/scratch/user/farid-bge/stderr/stderr_tpmcalculation.%j           # save stderr to file

module purge
module load GCC/9.3.0
module load TPMCalculator/0.0.4

##f_path="/scratch/user/farid-bge/RNA_mapping_pipeline/maize_mapping/maize_v4_test_samples_mapping/trimmed_RNAseq_samples"
gtf="/scratch/user/farid-bge/maize_ref_genome_index/Maize_ref_genome/maize_v4_Ref_genome/Zmays_493_RefGen_V4.gene_exons.gtf"

##for f in $(ls $f_path/*Aligned.sortedByCoord.out.bam | sed 's/Aligned.sortedByCoord.out.bam//')
##do
##bam_file="${f}Aligned.sortedByCoord.out.bam"
##output_file="${f}tpm.txt"
## for one by one sample
bam_file="/scratch/user/farid-bge/RNA_mapping_pipeline/maize_mapping/maize_v4_test_samples_mapping/trimmed_RNAseq_samples/SRR8197399_Aligned.sortedByCoord.out.bam"

TPMCalculator -g $gtf \
-b $bam_file \
-c 150 \
-p 
###done