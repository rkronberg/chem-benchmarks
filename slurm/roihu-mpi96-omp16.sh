#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=medium
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=24
#SBATCH --cpus-per-task=16
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=16

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
