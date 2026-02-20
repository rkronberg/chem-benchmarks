SCRIPT="gmx_mpi mdrun"
ARGS="-s $1 -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -nsteps -1 -maxh 0.1 -resethway -noconfout -notunepme"

if [[ $SLURM_GPUS_PER_NODE -gt 0 ]]; then
    ARGS="$ARGS -nb gpu -bonded gpu -pme gpu -update gpu"
    if [[ $HOSTNAME == "nid"* ]]; then
        export GMX_ENABLE_DIRECT_GPU_COMM=1
        export GMX_FORCE_GPU_AWARE_MPI=1
        source slurm/lumi-affinity.sh
    fi
fi

if [[ $SLURM_GPUS_PER_NODE -gt 1 ]]; then
    ARGS="$ARGS -nstlist 300"
    if $SCRIPT -version | grep -Eiq "cufftmp|heffte"; then
        ARGS="$ARGS -npme $((2*SLURM_NNODES))"
        export GMX_GPU_PME_DECOMPOSITION=1
        export GMX_PMEONEDD=1
    else
        ARGS="$ARGS -npme 1"
    fi
fi

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
