#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=standard-g
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=8
#SBATCH --gpus-per-node=8
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=7

cd $SLURM_SUBMIT_DIR

source slurm/common-lumi-gpu.sh
