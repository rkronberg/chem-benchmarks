module list

WRAPPER=$1
shift

ENV_BEFORE=$(export -p)
STACK_BEFORE=$(ulimit -s)

run() {
    local env_diff
    env_diff=$(diff <(echo "$ENV_BEFORE") <(export -p) | grep -v ' declare -x _=')

    JOB_SETUP=$(
        echo "module reset"
        if [[ $HOSTNAME == "nid"* ]]; then
            echo "module use /appl/local/csc/modulefiles"
        fi
        echo "module load" $(module -t list 2>&1 | grep -v ':$')
        echo "$env_diff" | sed -n 's/^> declare -x /export /p'
        for name in $(echo "$env_diff" | sed -n 's/^< declare -x \([^=]*\).*/\1/p'); do
            [[ -v $name ]] || echo "unset $name"
        done
        if [[ $(ulimit -s) != "$STACK_BEFORE" ]]; then
            echo "ulimit -s $(ulimit -s)"
        fi
        echo "${*//$SLURM_JOBID/\$SLURM_JOBID}"
    ) awk '
        /^source slurm\/common\.sh/ { print ENVIRON["JOB_SETUP"]; next }
        { print }
    ' "$0" > "jobscripts/$SLURM_JOBID.sh"

    (set -x
    "$@"
    )
}

source "$WRAPPER" "$@"

(set -x
date
)
