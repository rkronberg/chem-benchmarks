ARGS="-i benchmarks/H2O-256.inp -o logs/cp2k-$SLURM_JOBID.out"
SCRIPT="cp2k.psmp"

(set -x
srun $SCRIPT $ARGS $*
)

# Cleanup
rm H2O-256-*
