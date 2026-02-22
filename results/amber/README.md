# Amber

| Version | Benchmark | System | GPU backend      | MPI ranks | Threads/rank | GPUs | Performance (ns/day) | Plot      | Date       |
|---------|-----------|--------|------------------|-----------|--------------|------|----------------------|-----------|------------|
| 24      | Cellulose | LUMI   | HIP (ROCm 6.3.4) | 1         | 1            | 1    | 65.63                | [View][1] | 2026-02-21 |
|         |           |        |                  | 2         | 1            | 2    | 74.04                |           |            |
|         |           |        |                  | 4         | 1            | 4    | 86.06                |           |            |
|         |           |        |                  | 8         | 1            | 8    | 92.02                |           |            |
| 24      | STMV      | LUMI   | HIP (ROCm 6.3.4) | 1         | 1            | 1    | 41.96                | [View][2] | 2026-02-21 |
|         |           |        |                  | 2         | 1            | 2    | 49.09                |           |            |
|         |           |        |                  | 4         | 1            | 4    | 54.91                |           |            |
|         |           |        |                  | 8         | 1            | 8    | 57.27                |           |            |

[1]: ../img/amber-24-cellulose-lumi-gpu-hip.svg
[2]: ../img/amber-24-stmv-lumi-gpu-hip.svg
