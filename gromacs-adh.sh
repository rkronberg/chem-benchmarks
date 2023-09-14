ARGS="-s benchmarks/adh_dodec.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -notunepme -resetstep 5000"
SCRIPT="gmx_mpi mdrun"

if [[ $SLURM_GPUS_ON_NODE -ne 0 ]]; then
    ARGS="$ARGS -nb gpu -bonded gpu -pme gpu -update gpu -nstlist 200"
fi

if [[ $SLURM_GPUS_ON_NODE -gt 1 ]]; then
    ARGS="$ARGS -npme 1"
fi

(set -x
srun $SCRIPT $ARGS $*
)
