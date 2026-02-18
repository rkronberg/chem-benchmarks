# Strong scalability of GROMACS

| GROMACS | System | Benchmark | GPU backend | GPU platform | AdaptiveCpp | GPU FFT lib | Multi-GPU FFT lib | Compiler     | Date       | Results                        |
|---------|--------|-----------|-------------|--------------|-------------|-------------|-------------------|--------------|------------|--------------------------------|
| 2026.0  | LUMI   | STMV      | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1 | None              | Clang 17.0.0 | 2026-02-16 | [Link](#20260-lumi-stmv-sycl)  |
| 2025.4  | LUMI   | STMV      | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1 | None              | Clang 17.0.0 | 2026-02-16 | [Link](#20254-lumi-stmv-sycl)  |
| 2024.3  | LUMI   | STMV      | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1 | None              | Clang 17.0.0 | 2026-02-16 | [Link](#20243-lumi-stmv-sycl)  |
| 2023.1  | LUMI   | STMV      | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1 | None              | Clang 17.0.0 | 2026-02-16 | [Link](#20231-lumi-stmv-sycl)  |

## 2026.0, LUMI, STMV, SYCL

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.975               |
| 3         | 7            | 2    | 35.561               |
| 8         | 4            | 4    | 68.044               |
| 8         | 7            | 8    | 110.665              |

![](2026.0-sycl-stmv-lumi.svg)

[2026.0-sycl-stmv-lumi.csv](2026.0-sycl-stmv-lumi.csv)

## 2025.4, LUMI, STMV, SYCL

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.844               |
| 3         | 7            | 2    | 35.098               |
| 8         | 4            | 4    | 68.820               |
| 8         | 7            | 8    | 107.761              |

![](2026.0-sycl-stmv-lumi.svg)

[2026.0-sycl-stmv-lumi.csv](2026.0-sycl-stmv-lumi.csv)

## 2024.3, LUMI, STMV, SYCL

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 17.940               |
| 3         | 7            | 2    | 32.266               |
| 8         | 4            | 4    | 61.754               |
| 8         | 7            | 8    | 105.611              |

## 2023.1, LUMI, STMV, SYCL


| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 16.468               |
| 4         | 3            | 2    | 26.479               |
| 8         | 3            | 4    | 53.306               |
| 8         | 7            | 8    | 78.856               |
