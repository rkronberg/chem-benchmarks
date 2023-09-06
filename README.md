# Chemistry benchmarks

Benchmark input files and batch scripts for selected chemistry
software on CSC's supercomputers (Puhti, Mahti, LUMI).

Setup inspired by <https://github.com/mvsjober/ml-benchmarks>

## Usage

Select a benchmark and Slurm settings of your choice in accordance
with the system you're running on. For example, the GROMACS ADH
benchmark could be run on Puhti using 40 cores with one thread
per MPI rank as follows:

```bash
module purge
module load gcc/11.3.0 openmpi/4.1.4 gromacs/2023.2
sbatch slurm/puhti-cpu40-omp1.sh gromacs-adh.sh
```

Remember to initialize the required module environment before
running `sbatch`.

## Available benchmarks

### GROMACS

From J. Chem. Phys. **153**, 134110 (2020); doi: 10.1063/5.0018516

* `adh_dodec.tpr`: Alcohol dehydrogenase solvated in TIP3P water
  in a truncated dodecahedron box and using the AMBER99sb-ildn
  force field. 95561 atoms, 2 fs time-step, 0.9 nm cut-offs,
  0.1125 nm PME grid spacing, h-bond constraints, NVT ensemble.
* `stmv.tpr`: Satellite Tobacco Mosaic Virus solvated in TIP3P
  using cubic box and the CHARMM27 force field. 1066628 atoms,
  2 fs time-step, 1.2 nm cut-offs, h-bond constraints, 0.15 nm
  PME grid spacing, NVT ensemble.
