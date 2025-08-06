#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=debug
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --mem=0
#SBATCH --time=30
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR

source slurm/common.sh
