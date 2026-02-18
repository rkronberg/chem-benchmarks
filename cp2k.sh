ARGS="-i $1"
SCRIPT="cp2k.psmp"

if [[ $HOSTNAME == "nid"* ]]; then
    ulimit -s unlimited
    export OMP_STACKSIZE=512M
fi

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
