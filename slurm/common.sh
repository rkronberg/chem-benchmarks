module list

WRAPPER=$1
shift

JOBFILE="jobscripts/$SLURM_JOBID.sh"

MODULE_USE=""
if [[ $HOSTNAME == "nid"* ]]; then
    MODULE_USE="module use /appl/local/csc/modulefiles"
fi

{
    MODULE_USE="$MODULE_USE" \
    MODULES="$(echo $(module -t list 2>&1 | grep -v ':$'))" \
    JOB_ARGS="$(printf '%q ' "$WRAPPER" "$@")" \
    awk '
        /^# ==== / { exit }
        /^# >>> saved environment/ { skip = 1 }
        skip { if (/^# <<< saved environment/) skip = 0; next }
        /^source slurm\/common\.sh/ {
            print "# >>> saved environment"
            print "module reset"
            if (ENVIRON["MODULE_USE"] != "") print ENVIRON["MODULE_USE"]
            print "module load " ENVIRON["MODULES"]
            print "set -- " ENVIRON["JOB_ARGS"]
            print "# <<< saved environment"
        }
        { print }
    ' "$0"
    echo "# ==== $WRAPPER ===="
    sed 's/^/# /' "$WRAPPER"
    echo "# ==== executed commands ===="
} > "$JOBFILE"

run() {
    echo "# $*" >> "$JOBFILE"
    (set -x
    "$@"
    )
}

source "$WRAPPER" "$@"

(set -x
date
)
