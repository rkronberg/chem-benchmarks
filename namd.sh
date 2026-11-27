SCRIPT="namd3"
NP=""
PMEPES=""

if [[ $SLURM_GPUS_ON_NODE -gt 0 ]]; then
    case "$HOSTNAME:$SLURM_GPUS_ON_NODE" in
        nid*:1) NP=7 ;;
        nid*:2) NP=14;  PMEPES="+pmepes 7" ;;
        nid*:4) NP=26;  PMEPES="+pmepes 5" ;;
        nid*:8) NP=50;  PMEPES="+pmepes 1" ;;
        rg*:1)  NP=72 ;;
        rg*:2)  NP=135; PMEPES="+pmepes 63" ;;
        rg*:4)  NP=253; PMEPES="+pmepes 37" ;;
    esac
fi

if [[ -n $NP ]]; then
    SRUN_OPTS="--cpus-per-task $NP"
    ARGS="+p $NP $PMEPES +setcpuaffinity +devices $(seq -s, 0 $((SLURM_GPUS_ON_NODE - 1))) $1"
elif [[ ${SLURM_CPUS_PER_TASK:-0} -ge 2 ]]; then
    ARGS="+ppn $((SLURM_CPUS_PER_TASK - 1)) $1"
else
    echo "namd.sh: --cpus-per-task must be at least 2 (one core is used for communication)" >&2
    exit 1
fi

unset OMP_NUM_THREADS

run srun $SRUN_OPTS $SCRIPT $ARGS
