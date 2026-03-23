ARGS="-input $1"
SCRIPT="pw.x"

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
