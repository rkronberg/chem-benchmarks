ARGS="-i benchmarks/h-BN-diag.inp"
SCRIPT="cp2k.psmp"

(set -x
srun $SCRIPT $ARGS $*
)
