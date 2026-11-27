CPU_BIND="mask_cpu:fe000000000000,fe00000000000000,fe0000,fe000000,fe,fe00,fe00000000,fe0000000000"

SRUN_OPTS="--cpu-bind=$CPU_BIND ./slurm/select_gpu.sh"
