#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=gputest
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=10
#SBATCH --mem=128G
#SBATCH --time=15
#SBATCH --gres=gpu:v100:2
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=10

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
