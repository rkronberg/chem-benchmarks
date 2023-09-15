ARGS="-O -i benchmarks/mdin.GPU -p benchmarks/cellulose.prmtop -c benchmarks/cellulose.inpcrd -o logs/mdout.GPU -x logs/mdcrd -inf logs/mdinfo -r logs/restrt -l logs/logfile"

if [[ $HOSTNAME == "nid"* ]]; then
    SCRIPT="pmemd.hip"
else
    SCRIPT="pmemd.cuda"
fi

if [[ $SLURM_GPUS_ON_NODE -gt 1 ]]; then
    SCRIPT="$SCRIPT.MPI"
fi

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS $*
)
