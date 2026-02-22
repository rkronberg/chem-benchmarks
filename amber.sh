if [[ $SLURM_GPUS_PER_NODE -gt 0 ]]; then
    if [[ $HOSTNAME == "nid"* ]]; then
        SCRIPT="pmemd.hip"
        source slurm/lumi-affinity.sh
    else
        SCRIPT="pmemd.cuda"
    fi
else
    SCRIPT="pmemd.MPI"
fi

if [[ $SLURM_GPUS_PER_NODE -gt 1 ]]; then
    SCRIPT="$SCRIPT.MPI"
fi

ARGS="-O -i $1.mdin.GPU \
      -p $1.prmtop \
      -c $1.inpcrd \
      -o logs/mdout-$SLURM_JOBID \
      -x logs/mdcrd-$SLURM_JOBID \
      -inf logs/mdinfo-$SLURM_JOBID \
      -r logs/restrt-$SLURM_JOBID \
      -l logs/logfile-$SLURM_JOBID"

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS
)
