# Chemistry benchmarks

Benchmark input files and batch scripts for CSC's supercomputers
(Puhti, Mahti, LUMI).

Setup inspired by <https://github.com/mvsjober/ml-benchmarks>

## Usage

Select a benchmark and Slurm settings of your choice in accordance
with the system you're running on. For example, the GROMACS STMV
benchmark could be run on Puhti using 40 CPU cores as follows:

```bash
module purge
module load gcc/11.3.0 openmpi/4.1.4 gromacs/2023.2
sbatch slurm/puhti-cpu40.sh gromacs-stmv.sh
```

Remember to initialize the required module environment before
running `sbatch`. Try `module spider <module>/<version>` to see
how to load a module.
