#!/bin/bash
#SBATCH --account=project_462000007
#SBATCH --partition=standard-g
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --time=15
#SBATCH --output=logs/slurm-%x-%j.out

export OMP_NUM_THREADS=7
export MPICH_GPU_SUPPORT_ENABLED=1

cd $SLURM_SUBMIT_DIR

WRAPPER="select_gpu_$SLURM_JOBID"

cat << EOF > $WRAPPER
#!/bin/bash

export ROCR_VISIBLE_DEVICES=\$((SLURM_LOCALID%SLURM_GPUS_PER_NODE))
exec \$*
EOF

chmod +x ./$WRAPPER

CPU_BIND="mask_cpu:fe000000000000,fe00000000000000"
CPU_BIND="${CPU_BIND},fe0000,fe000000"
CPU_BIND="${CPU_BIND},fe,fe00"
CPU_BIND="${CPU_BIND},fe00000000,fe0000000000"

SRUN_OPTS="--cpu-bind=$CPU_BIND ./$WRAPPER"

source slurm/common.sh
rm ./$WRAPPER
