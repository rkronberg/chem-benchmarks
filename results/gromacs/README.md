# GROMACS

| GROMACS | Benchmark | System | GPU backend | GPU platform | AdaptiveCpp | GPU FFT lib | Multi-GPU FFT lib | Compiler     | Date       | Results                            |
|---------|-----------|--------|-------------|--------------|-------------|-------------|-------------------|--------------|------------|------------------------------------|
| 2026.0  | STMV      | LUMI   | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1 | None              | Clang 18.0.0 | 2026-02-18 | [Link](#20260-stmv-lumi-gpu-sycl)  |

## 2026.0-STMV-LUMI-GPU-SYCL

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.957               |
| 3         | 7            | 2    | 35.399               |
| 8         | 4            | 4    | 70.085               |
| 8         | 7            | 8    | 110.446              |

![](img/2026.0-stmv-lumi-gpu-sycl.svg)

[2026.0-stmv-lumi-gpu-sycl.csv](2026.0-stmv-lumi-gpu-sycl.csv)
