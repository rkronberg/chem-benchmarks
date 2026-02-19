# Chemistry benchmarks

Benchmark input files and batch scripts for selected chemistry
software on CSC's supercomputers (Puhti, Mahti, Roihu, LUMI).

Setup inspired by <https://github.com/mvsjober/ml-benchmarks>.

## Usage

Select a benchmark and Slurm settings of your choice in accordance
with the system you're running on. For example, the GROMACS ADH
benchmark could be run on Puhti using 40 cores with one thread
per MPI rank as follows:

```bash
module purge
module load gcc/11.3.0 openmpi/4.1.4 gromacs/2023.2
sbatch slurm/puhti-mpi40-omp1.sh gromacs-adh.sh
```

Remember to initialize the required module environment before
running `sbatch`.

## Systems overview

| System | Partition | Nodes | CPU compute          | Cores per node | GPU compute | GPUs per node |
|--------|-----------|-------|----------------------|----------------|-------------|---------------|
| Puhti  | CPU       | 682   | Intel Xeon Gold 6230 | 2 x 20 cores   | n/a         | n/a           |
|        | GPU       | 80    | Intel Xeon Gold 6230 | 2 x 20 cores   | Nvidia V100 | 4             |
| Mahti  | CPU       | 1404  | AMD EPYC Rome 7H12   | 2 x 64 cores   | n/a         | n/a           |
|        | GPU       | 24    | AMD EPYC Rome 7H12   | 2 x 64 cores   | Nvidia A100 | 4             |
| Roihu  | CPU       | 486   | AMD EPYC Turin 9965  | 2 x 192 cores  | n/a         | n/a           |
|        | GPU       | 132   | Nvidia Grace         | 4 x 72 cores   | Nvidia H100 | 4             |
| LUMI   | CPU       | 2048  | AMD EPYC Milan 7763  | 2 x 64 cores   | n/a         | n/a           |
|        | GPU       | 2978  | AMD EPYC Trento 7A53 | 1 x 64 cores   | AMD MI250X  | 8*            |

\* Strictly speaking, each LUMI GPU node has 4 GPUs. However, each MI250X GPU
is composed of two graphics compute dies (GCDs), which from a software
perspective act as separate GPU devices.

## Available benchmarks

### GROMACS

Based on J. Chem. Phys. **153**, 134110 (2020); doi: 10.1063/5.0018516

* `gromacs-adh.sh`: Alcohol dehydrogenase solvated in TIP3P water
  in a truncated dodecahedron box and using the AMBER99sb-ildn
  force field. 95561 atoms, 2 fs time-step, 0.9 nm cut-offs,
  0.1125 nm PME grid spacing, h-bond constraints, NVT ensemble.
* `gromacs-stmv.sh`: Satellite Tobacco Mosaic Virus solvated in TIP3P
  using cubic box and the CHARMM27 force field. 1066628 atoms,
  2 fs time-step, 1.2 nm cut-offs, h-bond constraints, 0.15 nm
  PME grid spacing, NVT ensemble.

### CP2K

Based on <https://github.com/cp2k/cp2k/tree/master/benchmarks>

* `cp2k-qs.sh`: 256 water molecules (768 atoms, 2048 electrons) in
  a 19.7 cubic angstrom cell. BOMD is run for 10 steps using
  Quickstep DFT and a 280 Ry cut-off at the LDA/TZV2P level of
  theory. The initial electron density is guessed based on atomic
  orbitals and the OT method is applied for SCF.
* `cp2k-hyb.sh`: 64 water molecules (192 atoms, 512 electrons) in
  a 12.4 cubic angstrom cell. BOMD is run for 10 steps using
  Quickstep DFT and a 400 Ry cut-off at the PBE0/TZVP level of
  theory. The initial electron density is guessed based on atomic
  orbitals and the OT method is applied for SCF.
* `cp2k-ls-scf.sh`: Quickstep density matrix linear scaling DFT
  calculation of 6144 atoms in a 39 cubic angstrom box (2048 water
  molecules in total). An LDA functional is used with a DZVP MOLOPT
  basis set and a 300 Ry cut-off.
* `cp2k-diag.sh`: Quickstep DFT calculation of hexagonal boron
  nitride adsorbed on Rh(111) (914 atoms, 6536 electrons). The PBE-D3
  functional is used with a DZVP MOLOPT basis set and a 500 Ry cut-off.
  Standard diagonalization with Fermi-Dirac smearing (300 K) and the
  ELPA library is applied for SCF.

### Amber

Based on <https://ambermd.org/GPUPerformance.php>

* `amber-cellulose.sh`: Cellulose nanofibril in TIP3P water
  in a cubic box. 408609 atoms, 4 fs time-step, 0.9 nm cut-offs,
  NPT ensemble. Single GPU benchmark.
