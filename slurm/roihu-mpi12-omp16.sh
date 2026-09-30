#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=16
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=16

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
