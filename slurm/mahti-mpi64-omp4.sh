#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=medium
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=4
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=4

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
