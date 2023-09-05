module list

SCRIPT=$1
shift
source $SCRIPT $*

(set -x
date
)
