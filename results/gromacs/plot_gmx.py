#!/usr/bin/env python3

import sys
from pathlib import Path
from datetime import datetime
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


def main():

    if len(sys.argv) < 2:
        print("Usage: python3 make_plot.py file1.csv [file2.csv ...]")
        sys.exit(1)

    sns.set_theme(palette="Set2")

    datasets = []
    max_len = 0
    all_vals = []

    for fname in sys.argv[1:]:
        try:
            df = pd.read_csv(fname)
        except Exception as e:
            print(e)
            sys.exit(1)
        labels = df.iloc[:, 0].astype(str).tolist()
        vals = pd.to_numeric(df.iloc[:, 1]).tolist()
        datasets.append((Path(fname).stem, labels, vals))
        max_len = max(max_len, len(vals))
        all_vals.extend(vals)

    ymin, ymax = min(all_vals), max(all_vals)
    offset = 0.01 * (ymax - ymin or 1)

    n = len(datasets)
    x = np.arange(max_len)
    width = 0.8 / n

    _, ax = plt.subplots(figsize=(6, 5))

    for i, (name, labels, vals) in enumerate(datasets):
        k = len(vals)
        pos = x[:k] + (i - n/2) * width + width/2
        bars = ax.bar(pos, vals, width, label=name)

        for j, bar in enumerate(bars):
            ax.text(
                bar.get_x() + bar.get_width()/2,
                bar.get_y() + bar.get_height()/2,
                labels[j],
                ha="center", va="center",
                rotation=90, fontsize=10
            )

            ax.text(
                bar.get_x() + bar.get_width()/2,
                vals[j] + offset,
                vals[j],
                ha="center", va="bottom",
                rotation=90, fontsize=10
            )

    ax.set_xticks([])
    ax.set_xlabel("Number of processors (CPU cores or GPUs)")
    ax.set_ylabel("Performance (ns/day)")
    ax.legend()

    plt.tight_layout()

    outfile = "img/out-%s.svg" % datetime.now().strftime("%Y%m%d%H%M%S")
    print("Saving %s" % outfile)
    plt.savefig(outfile)


if __name__ == "__main__":
    main()
