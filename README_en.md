[中文版本](README.md) · [English version](README_en.md)

Project Overview
----
This repository contains code, assignments, and notes related to UC Berkeley's CS189 course. This README is intended to allow instructors or TAs to reproduce and run the main assignments/notebooks locally or on a server, and to quickly locate key files and execution steps.

Prerequisites
----
- OS: Linux / WSL2 / macOS / Windows (with a suitable Python environment)
- Python: Recommended Python 3.10 - 3.11 (some packages may prefer newer Python versions)
- Recommended tools: pip, virtualenv or conda, JupyterLab (for opening .ipynb files)
- GPU users: install matching CUDA toolkit and drivers as needed (note: root `requirements.txt` contains several NVIDIA CUDA/cuDNN packages; adjust per your environment)

Quick Start (recommended)
----
1. Clone the repository and change to the project root:

```bash
git clone <repository-url>
cd /root/UCB_CS189
```

2. Create and activate a virtual environment (venv example):

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

If using conda:

```bash
conda create -n cs189 python=3.10 -y
conda activate cs189
pip install -r requirements.txt
```

3. Start JupyterLab (if you need to view/run notebooks):

```bash
pip install jupyterlab
jupyter lab
```

Running — Notebooks
----
- Course scraping/organization notebook: `FA25/cs189_content_downloader.ipynb`
- Lecture and discussion notebooks: under `FA25/Lec*`, `FA25/Dis*`
- Examples and test notebooks: `HW1/test_data.ipynb`

Running — Assignment Scripts (example: HW1)
----
The `HW1` directory contains several standalone Python scripts and utilities:

- `HW1/2e.py`, `HW1/3_4.py`, `HW1/5.py`, `HW1/6.py`, `HW1/7.py`: main assignment solution scripts (run with Python interpreter)
- `HW1/scripts/`:
  - `check.py`: script to check assignment outputs (ensure file paths are correct before running)
  - `featurize.py`: feature engineering utilities
  - `load.py`: data loading helper
  - `save_csv.py`: save results to CSV utility

Example: run the script for problem 5

```bash
cd /root/UCB_CS189
python HW1/5.py
```

Example using utility scripts

```bash
python HW1/scripts/featurize.py --input HW1/data/train.csv --output HW1/data/train_feats.csv
python HW1/scripts/check.py --predictions mnist_predictions.csv
```

Data
----
- Assignment data is typically placed in each assignment's `data/` subfolder (e.g., `HW1/data/`). Make sure required data files are present or download them according to assignment instructions.
- Some scripts may require external API tokens or credentials (see next section).

About `token.txt` (security note)
----
There is a `token.txt` file in the repository root (may contain an API token). Do NOT expose private tokens in a public repository. Recommended practices:

- Store `token.txt` locally and add it to `.gitignore` (if not already ignored)
- Or use environment variables:
  - Bash: `export HF_TOKEN=your_token_here`
  - In Python: `os.environ.get("HF_TOKEN")`

Do not paste actual token values in the README.

Troubleshooting
----
- Installation / dependency conflicts: try upgrading pip or using a fresh virtual environment. For GPU-related packages, install the matching wheel for your CUDA version.
- Jupyter kernel not found: ensure the virtual environment is activated and `ipykernel` is installed. You can register a kernel with:

```bash
python -m ipykernel install --user --name=cs189
```

- Permission or path issues: run commands from the repository root or use absolute paths.

High-level File Structure
----
Below is a high-level view of the repository to help quickly locate content (many subfolders omitted — run `tree -L 2` for a fuller view):

- `FA25/` — course materials and notebooks (includes `cs189_content_downloader.ipynb`, `Lec*`, `Dis*`, etc.)
  - `FA25/cs189_content_downloader.ipynb`
  - `FA25/Lec1/`, `FA25/Dis1/`, ...
- `HW1/` — Homework 1: solution scripts, data, and example notebooks
  - `HW1/2e.py`, `HW1/3_4.py`, `HW1/5.py`, `HW1/6.py`, `HW1/7.py`
  - `HW1/data/` (assignment data)
  - `HW1/scripts/` (utilities: `check.py`, `featurize.py`, `load.py`, `save_csv.py`)
  - `HW1/test_data.ipynb`
- `HW3/`, `HW4/`, ... — other homework directories (similar format)
- `ISL_python/` — implementations for textbook (ISL) chapter exercises (`Ch2/`, `Ch3/`, ...)
- `requirements.txt` — root-level dependencies
- `token.txt` — (sensitive; do not publish)

Semester / Assignment Classification
----
- `FA25/`: FALL 2025 labs and lecture notes (lectures, discussions, and a content organization/downloader notebook)
- `ISL_python/`: Python implementations and exercises for the ISL textbook chapters
- `HW1/`, `HW3/`, `HW4/`: SPRING 2025 labs/homework (each HW folder contains solutions, data, and helper scripts). For grading or evaluation, navigate to the relevant HW folder and follow the run instructions in this README.

Optional: full file tree
----
If an instructor wants the full file tree, run from the project root:

```bash
sudo apt install tree -y    # if not installed (Debian/Ubuntu)
tree -L 3
```



