#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=medium
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=48
#SBATCH --cpus-per-task=8
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=8

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
