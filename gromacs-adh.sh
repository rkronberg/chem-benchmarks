ARGS="-s benchmarks/adh_dodec.tpr -e logs/ener-$SLURM_JOBID.edr -g logs/md-$SLURM_JOBID.log -maxh 0.2 -noconfout -notunepme -resetstep 5000"

if [[ $SLURM_GPUS_ON_NODE -gt 0 ]]; then
    ARGS="$ARGS -nb gpu -bonded gpu -pme gpu -update gpu -nstlist 200"
fi

if [[ $SLURM_GPUS_ON_NODE -gt 1 ]]; then
    ARGS="$ARGS -npme 1"
    if [[ $HOSTNAME == "nid"* ]]; then
	export GMX_ENABLE_DIRECT_GPU_COMM=1
        export GMX_FORCE_GPU_AWARE_MPI=1
    fi
fi

SCRIPT="gmx_mpi mdrun"

(set -x
srun $SRUN_OPTS $SCRIPT $ARGS $*
)
