#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=2
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=2

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
