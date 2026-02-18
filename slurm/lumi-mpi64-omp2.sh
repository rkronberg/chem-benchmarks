#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=2
#SBATCH --mem=0
#SBATCH --time=30
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=2

cd $SLURM_SUBMIT_DIR

source slurm/common.sh
