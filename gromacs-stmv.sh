ARGS="-s benchmarks/stmv.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -notunepme -resetstep 5000"

if [[ $SLURM_GPUS_ON_NODE -ne 0 ]]; then
    ARGS="$ARGS -nb gpu -bonded gpu -pme gpu -update gpu -nstlist 400"
fi

if [[ $SLURM_GPUS_ON_NODE -gt 1 ]]; then
    ARGS="$ARGS -npme 1"
fi

SCRIPT="gmx_mpi mdrun"

# .tpr file is >100MB, so download it from Allas instead
wget -O benchmarks/stmv.tpr https://rasmus.a3s.fi/stmv.tpr

(set -x
srun $SCRIPT $ARGS $*
)
