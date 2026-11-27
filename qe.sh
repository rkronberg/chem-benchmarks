ARGS="-input $1"
SCRIPT="pw.x"

run srun $SRUN_OPTS $SCRIPT $ARGS
