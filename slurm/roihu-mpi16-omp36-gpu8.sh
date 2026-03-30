#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=gpumedium
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=36
#SBATCH --gres=gpu:gh200:4
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=36

env | grep SLURM

nvidia-cuda-mps-control -d

cd $SLURM_SUBMIT_DIR
source slurm/common.sh

echo quit | nvidia-cuda-mps-control
