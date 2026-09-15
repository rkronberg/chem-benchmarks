#!/usr/bin/env python3

import sys
from pathlib import Path
from datetime import datetime
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


def load_dataframes(filenames):
    try:
        return [pd.read_csv(fname) for fname in filenames]
    except Exception as e:
        print(e)
        sys.exit(1)


def make_xlabel(dfs):
    col0_names = [df.columns[0].lower() for df in dfs]
    has_cpu = any("cpu" in name for name in col0_names)
    has_gpu = any("gpu" in name for name in col0_names)

    if has_cpu and has_gpu:
        return "Number of processors (CPU cores or GPUs)"
    if has_gpu:
        return "Number of GPUs"
    if has_cpu:
        return "Number of CPU cores"
    return dfs[0].columns[0]


def plot_datasets(ax, dfs, names):
    all_vals = pd.concat(df.iloc[:, 1] for df in dfs)
    offset = 0.01 * (all_vals.max() - all_vals.min() or 1)

    n = len(dfs)
    x = np.arange(max(len(df) for df in dfs))
    width = 0.8 / n

    for i, (df, name) in enumerate(zip(dfs, names)):
        labels = df.iloc[:, 0].astype(str)
        vals = pd.to_numeric(df.iloc[:, 1])
        pos = x[:len(df)] + (i - n / 2) * width + width / 2
        bars = ax.bar(pos, vals, width, label=name)

        for bar, label, val in zip(bars, labels, vals):
            ax.text(
                bar.get_x() + bar.get_width() / 2,
                bar.get_y() + bar.get_height() / 2,
                label,
                ha="center", va="center",
                rotation=90, fontsize=10
            )
            ax.text(
                bar.get_x() + bar.get_width() / 2,
                val + offset,
                val,
                ha="center", va="bottom",
                rotation=90, fontsize=10
            )


def save_figure():
    outfile = "img/out-%s.svg" % datetime.now().strftime("%Y%m%d%H%M%S")
    print("Saving %s" % outfile)
    plt.savefig(outfile)


def main():

    if len(sys.argv) < 2:
        print("Usage: python3 make_plot.py file1.csv [file2.csv ...]")
        sys.exit(1)

    filenames = sys.argv[1:]
    dfs = load_dataframes(filenames)
    names = [Path(fname).stem for fname in filenames]

    sns.set_theme(palette="Set2")
    _, ax = plt.subplots(figsize=(6, 5))
    plot_datasets(ax, dfs, names)

    ax.set_xticks([])
    ax.set_xlabel(make_xlabel(dfs))
    ax.set_ylabel(dfs[0].columns[1])
    ax.legend()

    plt.tight_layout()
    save_figure()


if __name__ == "__main__":
    main()
