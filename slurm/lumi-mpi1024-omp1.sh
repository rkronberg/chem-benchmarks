#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=standard
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=30
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR

source slurm/common.sh
