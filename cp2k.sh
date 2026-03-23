ARGS="-i $1"
SCRIPT="cp2k.psmp"

if [[ $HOSTNAME == "nid"* ]]; then
    ulimit -s unlimited
    export OMP_STACKSIZE=512M
    if [[ $SLURM_GPUS_PER_NODE -gt 0 ]]; then
        source slurm/lumi-affinity.sh
    fi
fi

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
