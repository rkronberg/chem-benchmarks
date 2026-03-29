#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
