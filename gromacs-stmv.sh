ARGS="-s benchmarks/stmv.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -resetstep 10000"
SCRIPT="gmx_mpi mdrun"

(set -x
# .tpr file is huge, download it from Allas
wget -P benchmarks -O stmv.tpr https://a3s.fi/rasmus/stmv.tpr
srun $SCRIPT $ARGS $*
)
