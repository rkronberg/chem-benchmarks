ARGS="-i benchmarks/H2O-hyb.inp"
SCRIPT="cp2k.psmp"

(set -x
srun $SCRIPT $ARGS $*
)
