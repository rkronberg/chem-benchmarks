SCRIPT="lmp"
ARGS="-in $1 -log logs/log-$SLURM_JOBID.lammps -v x 4 -v y 4 -v z 4"

if [[ $SLURM_GPUS_PER_NODE -gt 0 ]]; then
    ARGS="$ARGS -k on t ${OMP_NUM_THREADS} g ${SLURM_GPUS_PER_NODE} -sf kk -pk kokkos"
    export OMP_PROC_BIND=spread
    export OMP_PLACES=threads
else
    ARGS="$ARGS -sf omp"
fi

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
