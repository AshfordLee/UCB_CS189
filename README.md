[English version](README_en.md) · [中文版本](README.md)

项目说明
----
本仓库为 UC Berkeley CS189 课程相关作业与笔记的代码集合。此 README 旨在让教授或助教能够在本地或服务器上复现、运行主要作业/笔记，并快速定位关键文件与运行步骤。

先决条件
----
- 操作系统：Linux / WSL2 / macOS / Windows（带符合要求的 Python 环境）
- Python 版本：建议 Python 3.10 - 3.11（某些包对新版 Python 支持较好）
- 建议安装：pip、virtualenv 或 conda、JupyterLab（用于打开 .ipynb）
- 若要使用 GPU：需安装 CUDA 与相应的 GPU 驱动（注意 requirements.txt 中包含若干 NVIDIA CUDA / cuDNN 包，按需调整）

快速开始（推荐）
----
1. 克隆仓库并进入项目根目录

```bash
git clone <repository-url>
cd /root/UCB_CS189
```

2. 创建虚拟环境并激活（使用 venv 为例）

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

如果你使用 conda：

```bash
conda create -n cs189 python=3.10 -y
conda activate cs189
pip install -r requirements.txt
```

3. 启动 JupyterLab（如果需要查看/运行笔记本）

```bash
pip install jupyterlab
jupyter lab
```

运行说明 — 笔记本
----
- 课程整理与下载脚本：`FA25/cs189_content_downloader.ipynb`
- 课堂与练习笔记：`FA25/Lec*`、`FA25/Dis*` 等目录下为多个讲义/习题的 Jupyter 笔记本
- 示例与测试数据：`HW1/test_data.ipynb`

运行说明 — 作业脚本（以 HW1 为例）
----
HW1 目录下包含若干独立 Python 脚本与工具：

- `HW1/2e.py`, `HW1/3_4.py`, `HW1/5.py`, `HW1/6.py`, `HW1/7.py`：主要作业解答脚本（可直接用 Python 解释器运行）
- `HW1/scripts/`：
  - `check.py`：用于检查作业输出的脚本（运行前请确保输出文件路径正确）
  - `featurize.py`：特征工程相关工具
  - `load.py`：数据加载工具
  - `save_csv.py`：结果保存为 CSV 的工具

示例：运行第 5 题脚本

```bash
cd /root/UCB_CS189
python HW1/5.py
```

如果需要运行脚本中的工具（示例）

```bash
python HW1/scripts/featurize.py --input HW1/data/train.csv --output HW1/data/train_feats.csv
python HW1/scripts/check.py --predictions mnist_predictions.csv
```

关于数据
----
- 作业数据通常放在各作业目录下的 `data/` 子目录（例如 `HW1/data/`）。请先确认数据文件已存在或根据作业说明下载。
- 若需下载数据或使用外部 API，可能需要配置 token 或凭证（见下文）。

关于 token.txt（安全提示）
----
根目录存在 `token.txt`（可能包含敏感 API token）。**不要**将你的私有 token 泄露到公开仓库中。运行需要 token 的脚本时，推荐的做法：

- 在本地创建 `token.txt`（仅包含 token）并将其加入 `.gitignore`（如果尚未忽略）
- 或使用环境变量：
  - Bash: `export HF_TOKEN=your_token_here`
  - Python 中读取：`os.environ.get("HF_TOKEN")`

请勿在 README 中贴出实际 token 值。

常见问题与排查
----
- 安装失败 / 依赖冲突：尝试升级 pip 或使用新的虚拟环境；对 GPU 相关包，可能需要根据实际 CUDA 版本安装对应 wheel。
- Jupyter 无法启动或内核找不到：确认虚拟环境已激活且已安装 `ipykernel`，可执行 `python -m ipykernel install --user --name=cs189` 注册内核。
- 权限或路径错误：确保在仓库根目录执行命令或使用绝对路径。

主要文件结构（高层次）
----
下面给出仓库的高层次目录结构以便快速定位（省略大量子文件夹，若需完整树可运行 `tree -L 2`）：

- `FA25/` — 课程资料与笔记（包含 `cs189_content_downloader.ipynb`、`Lec*`、`Dis*` 等）
  - `FA25/cs189_content_downloader.ipynb`
  - `FA25/Lec1/`, `FA25/Dis1/`, ...
- `HW1/` — 作业 1，包含脚本、数据与示例笔记
  - `HW1/2e.py`, `HW1/3_4.py`, `HW1/5.py`, `HW1/6.py`, `HW1/7.py`
  - `HW1/data/`（作业数据）
  - `HW1/scripts/`（工具脚本：`check.py`, `featurize.py`, `load.py`, `save_csv.py`）
  - `HW1/test_data.ipynb`
- `HW3/`, `HW4/`, ... — 其他作业目录（格式类似）
- `ISL_python/` — 伴随书籍或章节实现（`Ch2/`, `Ch3/`, ...）
- `requirements.txt` — 项目依赖（根目录）
- `token.txt` — （注意：含敏感信息，勿公开）
 
说明（学期与作业分类）
----
- `FA25/`：FALL 2025 学期的实验室与课堂笔记（包含讲义、练习与用于整理/下载课程内容的笔记本，例如 `FA25/cs189_content_downloader.ipynb`）。
- `ISL_python/`：配套教科书（ISL）每章习题的 Python 实现与练习代码，主要用于复现书中示例与练习结果。
- `HW1/`, `HW3/`, `HW4/`：这些目录均为 SPRING 2025 学期的实验/作业代码（每个 HW 目录内含题目解答脚本、数据与辅助脚本）。如果教授需要针对某一学期或某一作业进行评测，请定位到对应的 HW 目录并按照本 README 中的运行说明执行。

生成完整文件树（可选）
----
若教授希望查看完整的文件树，可在项目根运行：

```bash
sudo apt install tree -y    # 如果尚未安装（Debian/Ubuntu）
tree -L 3
```




