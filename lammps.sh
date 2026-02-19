SCRIPT="lmp"
ARGS="-in benchmarks/in.lj -log logs/log-$SLURM_JOBID.lammps -k on t ${OMP_NUM_THREADS} g ${SLURM_GPUS_PER_NODE} -sf kk -pk kokkos -v x 8 -v y 8 -v z 8"

export OMP_PROC_BIND=spread
export OMP_PLACES=threads

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
