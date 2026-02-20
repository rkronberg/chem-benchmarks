# GROMACS

| Version | Benchmark  | System | GPU backend | GPU platform | AdaptiveCpp | GPU FFT lib   | Multi-GPU FFT lib | Compiler     | Date       | Results                            |
|---------|------------|--------|-------------|--------------|-------------|---------------|-------------------|--------------|------------|------------------------------------|
| 2026.0  | STMV       | LUMI   | SYCL        | ROCm 6.3.4   | 24.02.0     | VkFFT 1.3.1   | n/a               | Clang 18.0.0 | 2026-02-18 | [Link](#20260-stmv-lumi-gpu-sycl)
| 2026.0  | STMV       | LUMI   | n/a         | n/a          | n/a         | n/a           | n/a               | GNU 14.3.0   | 2026-02-18 | [Link](#20260-stmv-lumi-cpu)
| 2025.4  | benchPEP-h | LUMI   | SYCL        | ROCm 6.3.4   | 24.02.0     | rocFFT 1.0.31 | HeFFTe 2.4.1      | Clang 18.0.0 | 2026-02-19 | [Link](#20254-benchpep-h-lumi-gpu-sycl-heffte)

![](../img/gmx-2026.0-stmv-lumi-cpu-vs-gpu-sycl.svg)

## 2026.0-STMV-LUMI-GPU-SYCL

<details>

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.957               |
| 3         | 7            | 2    | 35.399               |
| 8         | 4            | 4    | 70.085               |
| 8         | 7            | 8    | 110.446              |

![](../img/gmx-2026.0-stmv-lumi-gpu-sycl.svg)

</details>

## 2026.0-STMV-LUMI-CPU

<details>

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 128       | 1            | 0    | 10.175               |
| 256       | 1            | 0    | 21.201               |
| 512       | 1            | 0    | 36.942               |
| 1024      | 1            | 0    | 67.231               |

![](../img/gmx-2026.0-stmv-lumi-cpu.svg)

</details>

## 2025.4-benchPEP-h-LUMI-GPU-SYCL-HeFFTe

<details>

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 128       | 1            | 0    | 10.175               |
| 256       | 1            | 0    | 21.201               |
| 512       | 1            | 0    | 36.942               |
| 1024      | 1            | 0    | 67.231               |

![](../img/gmx-2025.4-benchpep-h-lumi-gpu-sycl-heffte.svg)

</details>
