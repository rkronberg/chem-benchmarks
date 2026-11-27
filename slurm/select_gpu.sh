#!/bin/bash

export ROCR_VISIBLE_DEVICES=$((SLURM_LOCALID % SLURM_GPUS_PER_NODE))
exec "$@"
