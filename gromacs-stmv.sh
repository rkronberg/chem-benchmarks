ARGS="-s benchmarks/stmv.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -resetstep 10000"
SCRIPT="gmx_mpi mdrun"

# .tpr file is huge, download it from Allas
wget -O benchmarks/stmv.tpr https://a3s.fi/rasmus/stmv.tpr

(set -x
srun $SCRIPT $ARGS $*
)
