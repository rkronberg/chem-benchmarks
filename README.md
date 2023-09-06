# Chemistry benchmarks

Benchmark input files and batch scripts for selected chemistry
software on CSC's supercomputers (Puhti, Mahti, LUMI).

Setup inspired by <https://github.com/mvsjober/ml-benchmarks>.

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

Based on J. Chem. Phys. **153**, 134110 (2020); doi: 10.1063/5.0018516

* `adh_dodec.tpr`: Alcohol dehydrogenase solvated in TIP3P water
  in a truncated dodecahedron box and using the AMBER99sb-ildn
  force field. 95561 atoms, 2 fs time-step, 0.9 nm cut-offs,
  0.1125 nm PME grid spacing, h-bond constraints, NVT ensemble.
* `stmv.tpr`: Satellite Tobacco Mosaic Virus solvated in TIP3P
  using cubic box and the CHARMM27 force field. 1066628 atoms,
  2 fs time-step, 1.2 nm cut-offs, h-bond constraints, 0.15 nm
  PME grid spacing, NVT ensemble.

### CP2K

Based on <https://github.com/cp2k/cp2k/tree/master/benchmarks>

* `H2O-qs.inp`: 256 water molecules (768 atoms, 2048 electrons) in
  a 19.7 cubic angstrom cell. BOMD is run for 10 steps using
  Quickstep DFT and a 280 Ry cutoff at the LDA/TZV2P level of
  theory. The initial electron density is guessed based on atomic
  orbitals and the OT method is applied for SCF.
* `H2O-hyb.inp`: 64 water molecules (192 atoms, 512 electrons) in
  a 12.4 cubic angstrom cell. BOMD is run for 10 steps using
  Quickstep DFT and a 400 Ry cutoff at the PBE0/TZVP level of
  theory. The initial electron density is guessed based on atomic
  orbitals and the OT method is applied for SCF.
* `H2O-ls-scf.inp`: Quickstep density matrix linear scaling DFT
  calculation of 6144 atoms in a 39 cubic angstrom box (2048 water
  molecules in total). An LDA functional is used with a DZVP MOLOPT
  basis set and a 300 Ry cutoff.
* `h-BN-diag.inp`: Quickstep DFT calculation of hexagonal boron
  nitride adsorbed on Rh(111) (914 atoms, X electrons). The PBE-D3
  functional is used with a DZVP MOLOPT basis set and a 500 Ry cutoff.
  Standard diagonalization with Fermi-Dirac smearing (300 K) and the
  ELPA library is applied for SCF.
