# Chemistry benchmarks

Input files and batch scripts for benchmarking strong scalability of selected
chemistry software on CSC's supercomputers (Puhti, Mahti, Roihu, LUMI).

> Setup inspired by <https://github.com/mvsjober/ml-benchmarks>.

## Usage

> [!IMPORTANT]
> The benchmark inputs are stored with Git LFS. Make sure that you have Git LFS
> installed in order to access the files.
> [See instructions here](https://docs.github.com/en/repositories/working-with-files/managing-large-files/installing-git-large-file-storage).

Select a benchmark and Slurm settings of your choice in accordance
with the system you're running on. The general syntax is:

```bash
sbatch slurm/<template> <software script> benchmark/<software>/<input>
```

For example, the GROMACS ADH benchmark could be run on Puhti using 40 cores
with one thread per MPI rank as follows:

```bash
module purge
module load gcc/14.2.0 openmpi/5.0.6 gromacs/2025.4
sbatch slurm/puhti-mpi40-omp1.sh gromacs.sh benchmarks/gromacs/adh.tpr
```

On LUMI, also add CSC's module stack to your `MODULEPATH`. For example:

```bash
module use /appl/local/csc/modulefiles
module load gromacs/2026.1-gpu
sbatch slurm/lumi-mpi8-omp7-gcd8.sh gromacs.sh benchmarks/gromacs/stmv.tpr
```

> [!IMPORTANT]
> Remember to load all required environment modules before running `sbatch`.

## Systems overview

| System | Partition | Nodes | CPU compute          | Cores per node | GPU compute | GPUs per node |
|:------:|:---------:|:-----:|:--------------------:|:--------------:|:-----------:|:-------------:|
| Puhti  | CPU       | 682   | Intel Xeon Gold 6230 | 2 x 20         | -           | -             |
|        | GPU       | 80    | Intel Xeon Gold 6230 | 2 x 20         | Nvidia V100 | 4             |
| Mahti  | CPU       | 1404  | AMD EPYC Rome 7H12   | 2 x 64         | -           | -             |
|        | GPU       | 24    | AMD EPYC Rome 7H12   | 2 x 64         | Nvidia A100 | 4             |
| Roihu  | CPU       | 486   | AMD EPYC Turin 9965  | 2 x 192        | -           | -             |
|        | GPU       | 132   | Nvidia Grace         | 4 x 72         | Nvidia H100 | 4             |
| LUMI   | CPU       | 2048  | AMD EPYC Milan 7763  | 2 x 64         | -           | -             |
|        | GPU       | 2978  | AMD EPYC Trento 7A53 | 1 x 64         | AMD MI250X  | 8[^1]         |

[^1]: Each LUMI GPU node has 4 GPUs. However, each MI250X GPU is composed of
two graphics compute dies (GCDs), which from a software (and Slurm) perspective
act as separate GPU devices.

## Available benchmark input files

See [benchmarks](benchmarks/).

### GROMACS

From <https://doi.org/10.1063/5.0018516>.

* `adh.tpr`  
  Alcohol dehydrogenase solvated in TIP3P water in a truncated dodecahedron box
  and using the AMBER99sb-ildn force field. 95561 atoms, 2 fs time step, 0.9 nm
  cutoffs, 0.1125 nm PME grid spacing, h-bond constraints, NVT ensemble.
  Suitable for multi-node CPU and single-GPU simulations.
* `stmv.tpr`  
  Satellite tobacco mosaic virus solvated in TIP3P using cubic box and the
  CHARMM27 force field. 1066628 atoms, 2 fs time step, 1.2 nm cutoffs, h-bond
  constraints, 0.15 nm PME grid spacing, NVT ensemble. Suitable for multi-node
  CPU and single-node, multi-GPU simulations.

From <https://www.mpinat.mpg.de/grubmueller/bench>.

* `benchPEP-h.tpr`  
  Peptides in water. 12 M atoms, 2 fs time step, h-bond constraints. Suitable
  for multi-node CPU and multi-node, multi-GPU simulations.

### CP2K

From <https://github.com/cp2k/cp2k/tree/master/benchmarks>.

* `H2O-qs.inp`  
  256 water molecules (768 atoms, 2048 electrons) in a 19.7 cubic angstrom
  cell. BOMD is run for 10 steps using Quickstep DFT and a 280 Ry cutoff at the
  LDA/TZV2P level of theory. The initial electron density is guessed based on
  atomic orbitals and the OT method is applied for SCF.
* `H2O-hyb.inp`  
  64 water molecules (192 atoms, 512 electrons) in a 12.4 cubic angstrom cell.
  BOMD is run for 10 steps using Quickstep DFT and a 400 Ry cutoff at the
  PBE0/TZVP level of theory. The initial electron density is guessed based on
  atomic orbitals and the OT method is applied for SCF.
* `H2O-ls-scf.inp`  
  Quickstep density matrix linear scaling DFT calculation of 6144 atoms in a 39
  cubic angstrom box (2048 water molecules in total). An LDA functional is used
  with a DZVP MOLOPT basis set and a 300 Ry cutoff.
* `hBN-diag.inp`  
  Quickstep DFT calculation of hexagonal boron nitride adsorbed on Rh(111)
  (914 atoms, 6536 electrons). The PBE-D3 functional is used with a DZVP MOLOPT
  basis set and a 500 Ry cutoff. Standard diagonalization with Fermi-Dirac
  smearing (300 K) and the ELPA library is applied for SCF.

### Amber

From <https://ambermd.org/GPUPerformance.php>.

* `cellulose.mdin`  
  Cellulose nanofibril. 408609 atoms, 2 fs time step, 0.8 nm cutoffs, NPT
  ensemble. Depends on `cellulose.inpcrd` and `cellulose.prmtop`. Suitable for
  multi-node CPU and single-node, multi-GPU simulations.
* `stmv.mdin`  
  Satellite tobacco mosaic virus. 1067095 atoms, 4 fs time step, 0.8 nm
  cutoffs, NPT ensemble. Depends on `stmv.inpcrd` and `stmv.prmtop`. Suitable
  for multi-node CPU and single-node, multi-GPU simulations.

### LAMMPS

From <https://www.lammps.org/bench.html>.

* `in.lj`  
  Atomic fluid, Lennard-Jones potential with 2.5 sigma cutoff (55 neighbors per
  atom), NVE integration. System size is scaled by a factor of 4 along each
  spatial coordinate, resulting in a system of 2048000 atoms. Suitable for
  multi-node CPU and multi-node, multi-GPU simulations.

### NAMD

From <https://www.ks.uiuc.edu/Research/namd/benchmarks/>.

* `stmv_gpures_nve.namd`  
  Satellite tobacco mosaic virus. CHARMM force field (12 Å cutoff), multiple
  time stepping with 2 fs time step and 4 fs PME, rigid bond constraints. NVE
  ensemble. GPU-resident simulation mode, suitable for single-node, multi-GPU
  simulations. Depends on `stmv.pdb`, `stmv.psf` and `par_all27_prot_na.inp`.
* `stmv_nve.namd`  
  Satellite tobacco mosaic virus. CHARMM force field (12 Å cutoff), multiple
  time stepping with 2 fs time step and 4 fs PME, rigid bond constraints. NVE
  ensemble. Suitable for multi-node CPU simulations. Depends on `stmv.pdb`,
  `stmv.psf` and `par_all27_prot_na.inp`.

### Quantum ESPRESSO

From <https://github.com/QEF/benchmarks/tree/master/GRIR443>.

* `grir443.in`  
  Graphene on an Ir(111) surface (443 atoms) with 2233063 G-vectors, 4 k-points
  (Marzari-Vanderbilt smearing), and FFT grid dimensions (180, 180, 192). The
  benchmark measures the time to run 2 SCF iterations. Depends on
  `C.pbe-paw_kj-x.UPF` and `Ir.pbe-paw_kj-x.UPF`. Suitable for both multi-node
  CPU and single-node, multi-GPU simulations.
