ARGS="-i benchmarks/H2O-ls-scf.inp"
SCRIPT="cp2k.psmp"

(set -x
srun $SCRIPT $ARGS $*
)
