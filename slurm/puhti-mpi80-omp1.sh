#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --partition=test
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=40
#SBATCH --mem=0
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR
source slurm/common.sh
