module list

WRAPPER=$1
shift

ENV_BEFORE=$(export -p)
STACK_BEFORE=$(ulimit -s)

run() {
    local env_diff modules
    env_diff=$(diff <(echo "$ENV_BEFORE") <(export -p) | grep -v ' declare -x _=')
    modules=$(module -t list 2>&1 | grep -v ':$' | grep -vxF -f <(module reset &>/dev/null; module -t list 2>&1))

    {
        sed '/^source slurm\/common\.sh/,$d' "$0"
        echo

        echo "module reset"
        if [[ $HOSTNAME == "nid"* ]]; then
            echo "module use /appl/local/csc/modulefiles"
        fi
        if [[ -n $modules ]]; then
            echo "module load" $modules
        fi
        echo

        echo "$env_diff" | sed -n 's/^> declare -x /export /p'
        for name in $(echo "$env_diff" | sed -n 's/^< declare -x \([^=]*\).*/\1/p'); do
            [[ -v $name ]] || echo "unset $name"
        done
        if [[ $(ulimit -s) != "$STACK_BEFORE" ]]; then
            echo "ulimit -s $(ulimit -s)"
        fi
        echo

        echo "${*//-$SLURM_JOBID/-\$SLURM_JOBID}"

        sed '1,/^source slurm\/common\.sh/d' "$0"
    } | cat -s > "jobscripts/$SLURM_JOBID.sh"

    (set -x
    "$@"
    )
}

source "$WRAPPER" "$@"

(set -x
date
)
