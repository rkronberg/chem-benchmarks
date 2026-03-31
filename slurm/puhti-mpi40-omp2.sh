#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=large
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --cpus-per-task=2
#SBATCH --mem=0
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=2

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
