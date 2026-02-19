#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=standard-g
#SBATCH --nodes=16
#SBATCH --ntasks-per-node=8
#SBATCH --gpus-per-node=8
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=7
export MPICH_GPU_SUPPORT_ENABLED=1

cd $SLURM_SUBMIT_DIR

source slurm/common.sh
