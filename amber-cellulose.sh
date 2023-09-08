ARGS="-O -i benchmarks/mdin.GPU -p benchmarks/cellulose.prmtop -c benchmarks/cellulose.inpcrd -o logs/mdout.GPU -x logs/mdcrd -inf logs/mdinfo -r logs/restrt -l logs/logfile"
SCRIPT="pmemd.cuda"

(set -x
srun $SCRIPT $ARGS $*
)
