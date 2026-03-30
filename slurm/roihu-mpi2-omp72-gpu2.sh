#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=gpumedium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=72
#SBATCH --gres=gpu:gh200:2
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=72

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
