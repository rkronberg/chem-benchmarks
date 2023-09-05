ARGS="-s benchmarks/stmv.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -notunepme -resetstep 1000"
SCRIPT="gmx_mpi mdrun"

(set -x
# .tpr file is huge so download it from Allas
wget -P benchmarks https://a3s.fi/rasmus/stmv.tpr
srun $SCRIPT $ARGS $*
)
