# Results

## GROMACS

| Module        | Benchmark         | System | MPI ranks | Threads/rank | GPUs | Performance (ns/day) | Date       |
|---------------|-------------------|--------|-----------|--------------|------|----------------------|------------|
| `2021.5`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.627                | 2023-09-05 |
| `2021.5`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.210               | 2023-09-05 |
| `2023.2`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.871                | 2023-09-05 |
| `2023.2`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.646               | 2023-09-05 |
| `2022.4`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.385               | 2023-09-06 |
| `2022.4`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.685                | 2023-09-06 |
| `2022.4-cuda` | `gromacs-stmv.sh` | Puhti  | 1         | 10           | 1    | 13.725               | 2023-09-13 |
| `2022.4-cuda` | `gromacs-stmv.sh` | Mahti  | 1         | 32           | 1    | 20.566               | 2023-09-13 |
| `2022.4-cuda` | `gromacs-adh.sh`  | Mahti  | 1         | 32           | 1    | 336.037              | 2023-09-13 |

## CP2K

| Module   | Benchmark        | System | MPI ranks | Threads/rank | GPUs | Elapsed time (s) | Date       |
|----------|------------------|--------|-----------|--------------|------|------------------|------------|
| `2023.2` | `cp2k-qs.sh`     | Puhti  | 40        | 1            | 0    | 486.031          | 2023-09-06 |
| `2023.2` | `cp2k-ls-scf.sh` | Puhti  | 40        | 2            | 0    | 629.236          | 2023-09-06 |
| `2023.2` | `cp2k-hyb.sh`    | Puhti  | 40        | 1            | 0    | 723.141          | 2023-09-06 |
| `2023.2` | `cp2k-diag.sh`   | Puhti  | 40        | 2            | 0    | 378.897          | 2023-09-06 |

## Amber

| Module    | Benchmark            | System | MPI ranks | Threads/rank | GPUs | Performance (ns/day) | Date       |
|-----------|----------------------|--------|-----------|--------------|------|----------------------|------------|
| `22-cuda` | `amber-cellulose.sh` | Puhti  | 1         | 1            | 1    | 86.53                | 2023-09-08 |
| `22-cuda` | `amber-cellulose.sh` | Mahti  | 1         | 1            | 1    | 132.87               | 2023-09-08 |
