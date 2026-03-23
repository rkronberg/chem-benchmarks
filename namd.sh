SCRIPT="namd3"
ARGS="+ppn $((SLURM_CPUS_PER_TASK - 1)) $1"

if [[ $SLURM_GPUS_PER_NODE -gt 0 ]]; then
    if [[ $HOSTNAME == "nid"* ]]; then
        if [[ $SLURM_GPUS_PER_NODE -eq 1 ]]; then
            SRUN_OPTS="--cpus-per-task 7"
            ARGS="+p 7 +setcpuaffinity +devices 0 $1"
        fi
        if [[ $SLURM_GPUS_PER_NODE -eq 2 ]]; then
            SRUN_OPTS="--cpus-per-task 14"
            ARGS="+p 14 +pmepes 7 +setcpuaffinity +devices 0,1 $1"
        fi
        if [[ $SLURM_GPUS_PER_NODE -eq 4 ]]; then
            SRUN_OPTS="--cpus-per-task 26"
            ARGS="+p 26 +pmepes 5 +setcpuaffinity +devices 0,1,2,3 $1"
        fi
        if [[ $SLURM_GPUS_PER_NODE -eq 8 ]]; then
            SRUN_OPTS="--cpus-per-task 50"
            ARGS="+p 50 +pmepes 1 +setcpuaffinity +devices 0,1,2,3,4,5,6,7 $1"
        fi
    fi
fi

unset OMP_NUM_THREADS

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
