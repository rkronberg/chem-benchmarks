# GROMACS

| Module        | Benchmark         | System | MPI ranks | Threads/rank | GPUs | Performance (ns/day) | Date       |
|---------------|-------------------|--------|-----------|--------------|------|----------------------|------------|
| `2021.5`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.627                | 2023-09-05 |
| `2021.5`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.210               | 2023-09-05 |
| `2023.2`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.871                | 2023-09-05 |
| `2023.2`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.646               | 2023-09-05 |
| `2022.4`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 46.385               | 2023-09-06 |
| `2022.4`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 3.685                | 2023-09-06 |
| `2022.4-cuda` | `gromacs-stmv.sh` | Puhti  | 1         | 10           | 1    | 13.725               | 2023-09-13 |
| `2022.4-cuda` | `gromacs-stmv.sh` | Mahti  | 1         | 32           | 1    | 20.566               | 2023-09-14 |
| `2022.4-cuda` | `gromacs-adh.sh`  | Mahti  | 1         | 32           | 1    | 336.037              | 2023-09-14 |
| `2022.4-cuda` | `gromacs-adh.sh`  | Puhti  | 1         | 10           | 1    | 216.032              | 2023-09-14 |
| `2023.2`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.588                | 2023-09-14 |
| `2023.2`      | `gromacs-adh.sh`  | Mahti  | 128       | 1            | 0    | 127.931              | 2023-09-14 |
| `2023.2-gpu`  | `gromacs-stmv.sh` | LUMI   | 1         | 7            | 0.5  | 15.564               | 2023-09-14 |
| `2023.2-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 78.905               | 2023-09-14 |
| `2023.2-gpu`  | `gromacs-adh.sh`  | LUMI   | 1         | 7            | 0.5  | 234.541              | 2023-09-15 |
| `2023.3`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 48.042               | 2023-11-14 |
| `2023.3`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.475                | 2023-11-14 |
| `2023.3-gpu`  | `gromacs-stmv.sh` | LUMI   | 1         | 7            | 0.5  | 16.213               | 2023-11-17 |
| `2023.3-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 78.376               | 2023-11-17 |
| `2023.3-gpu`  | `gromacs-adh.sh`  | LUMI   | 1         | 7            | 0.5  | 232.214              | 2023-11-17 |
| `2024.3`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.744                | 2024-09-10 |
| `2024.3`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 6.927                | 2024-09-10 |
| `2024.3-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 105.015              | 2024-09-17 |
| `2024.4`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.843                | 2024-11-07 |
| `2024.4`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 6.927                | 2024-11-07 |
| `2024.4-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 105.624              | 2024-11-07 |
| `2025.1`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.889                | 2024-04-09 |
| `2025.1`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 6.864                | 2025-05-07 |
| `2025.1-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 109.033              | 2025-06-02 |
| `2025.1-gpu`  | `gromacs-adh.sh`  | LUMI   | 1         | 7            | 0.5  | 270.265              | 2025-06-02 |
| `2025.2-gpu`  | `gromacs-stmv.sh` | LUMI   | 8         | 7            | 4    | 109.791              | 2025-07-02 |
| `2025.2-gpu`  | `gromacs-adh.sh`  | LUMI   | 1         | 7            | 0.5  | 282.180              | 2025-07-02 |
| `2025.2`      | `gromacs-stmv.sh` | LUMI   | 128       | 1            | 0    | 10.415               | 2025-08-08 |
| `2025.2`      | `gromacs-adh.sh`  | LUMI   | 128       | 1            | 0    | 157.132              | 2025-08-08 |
| `2025.2`      | `gromacs-stmv.sh` | Mahti  | 128       | 1            | 0    | 9.934                | 2025-08-08 |
| `2025.2`      | `gromacs-adh.sh`  | Mahti  | 128       | 1            | 0    | 122.214              | 2025-08-08 |
| `2025.2`      | `gromacs-stmv.sh` | Puhti  | 80        | 1            | 0    | 6.736                | 2025-08-08 |
| `2025.2`      | `gromacs-adh.sh`  | Puhti  | 40        | 1            | 0    | 41.596               | 2025-08-08 |
