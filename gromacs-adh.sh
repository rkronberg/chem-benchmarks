ARGS="-s benchmarks/adh.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -resetstep 10000"
SCRIPT="gmx_mpi mdrun"

(set -x
srun $SCRIPT $ARGS $*
)
