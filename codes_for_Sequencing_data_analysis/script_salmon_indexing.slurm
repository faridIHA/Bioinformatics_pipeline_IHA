#!/bin/bash
#SBATCH --export=NONE               # do not export current env to the job
#SBATCH --job-name=salmon_indexing        # job name
#SBATCH --time=24:00:00             # max job run time dd-hh:mm:ss
#SBATCH --ntasks=1                 #Request 1 task 
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --mem=40G                    # total memory per node
#SBATCH --output=/scratch/user/farid-bge/stdout/stdout.%j      # save stdout to file
#SBATCH --error=/scratch/user/farid-bge/stderr/stderr.%j           # save stderr to file

#### Loading modules and software
module purge
### Loading GCC as requirements to run Salmon in HPRC
module load GCC/11.3.0
### Loading Salmon :
module load Salmon/1.10.1

### Indexing of reference Transcriptome genome by Salmon
input_file='/scratch/user/farid-bge/Transcripts_counting/maize/Ref_genome/Zmays_493_RefGen_V4.transcript.fa'
salmon index -t $input_file -i maizev4_index -k 31

## It took ~30 mins to finish.