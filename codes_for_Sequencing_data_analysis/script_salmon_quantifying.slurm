#!/bin/bash
#SBATCH --export=NONE               # do not export current env to the job
#SBATCH --job-name=salmon_quantifying       # job name
#SBATCH --time=20:00:00             # max job run time dd-hh:mm:ss
#SBATCH --ntasks=1                 #Request 1 task 
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=8           # CPUs (threads) per command
#SBATCH --mem=100G                    # total memory per node
#SBATCH --output=/scratch/user/farid-bge/stdout/stdout.%j      # save stdout to file
#SBATCH --error=/scratch/user/farid-bge/stderr/stderr.%j           # save stderr to file

#### Loading modules and software
module purge
### Loading GCC as requirements to run Salmon in HPRC
module load GCC/11.3.0
### Loading Salmon :
module load Salmon/1.10.1

### setting parameters
cpus=$SLURM_CPUS_PER_TASK
##file1="/scratch/user/farid-bge/Transcripts_counting/maize/samples/trimmed_samples/SRR8197457_1_paired.fq.gz"
##file2="/scratch/user/farid-bge/Transcripts_counting/maize/samples/trimmed_samples/SRR8197457_2_paired.fq.gz"

##samp='SRR8197457' ## For single sample running in case need

file='/scratch/user/farid-bge/RNA_mapping_pipeline/maize_Ref_gen_Raw_data/trimmed_sample'

### Transcripts quantification by Salmon with loop to run all samples together
for samp in $(ls $file/*1_paired.fq.gz | sed 's/1_paired.fq.gz//') 
do
salmon quant -i /scratch/user/farid-bge/Transcripts_counting/maize/Ref_genome/maizev4_index -l A -1 ${samp}1_paired.fq.gz -2 ${samp}2_paired.fq.gz -p $cpus --validateMappings -o /scratch/user/farid-bge/Transcripts_counting/maize/counting/${samp}quant
done