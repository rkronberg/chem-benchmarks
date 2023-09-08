#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=gputest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=10G
#SBATCH --time=15
#SBATCH --gres=gpu:v100:1
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
