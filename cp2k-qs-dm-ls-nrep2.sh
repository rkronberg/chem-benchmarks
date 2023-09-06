ARGS="-i benchmarks/H2O-dft-ls.NREP2.inp"
SCRIPT="cp2k.psmp"

(set -x
srun $SCRIPT $ARGS $*
)

# Cleanup
rm H2O-256-*
