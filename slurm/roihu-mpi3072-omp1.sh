#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=large
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=384
#SBATCH --time=0-1
#SBATCH --output=logs/slurm-%x-%j.out
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
