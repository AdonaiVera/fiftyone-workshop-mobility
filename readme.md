# 🚗 Getting Started with FiftyOne: Visual Search and Evaluation for Mobility

Welcome to the **90-minute workshop** on using [FiftyOne](https://voxel51.com/fiftyone/) for intelligent visual data exploration and model evaluation in mobility applications. In this hands-on session, you'll learn how to work with the **BDD100K dataset**, perform **semantic search**, apply **detection models**, and evaluate results — all within a flexible, visual-first environment.

---

## 📦 What's Inside

This repository includes three structured Jupyter notebooks:

### 🧭 1. `01_dataset_exploration.ipynb`
- Load the BDD100K dataset
- Explore metadata like weather, time of day, and scene
- Launch the FiftyOne App
- Filter and visualize driving scenarios

### 🔍 2. `02_similarity_embeddings.ipynb`
- Generate CLIP embeddings
- Build a similarity index
- Perform semantic search via:
  - Image queries
  - Text prompts (e.g., "foggy day" or "night highway")
- Visualize embeddings with UMAP

### 📊 3. `03_model_evaluation.ipynb`
- Apply YOLOv8 and YOLOv11 models using FiftyOne Model Zoo
- Compute uniqueness scores to find the most distinct samples
- Evaluate predictions against BDD100K annotations
- Export a curated 100-sample dataset

---

## 🚀 Setup Instructions

### 1. Clone the repository

```
git clone https://github.com/your-org/fiftyone-mobility-workshop.git
cd fiftyone-workshop-workshop
```

### 2. Create and activate a Python environment

**On macOS/Linux:**
```
python3 -m venv env
source env/bin/activate
```

**On Windows:**
```
python -m venv env
.\env\Scripts\activate
```

### 3. Install required packages
```
pip install --upgrade pip
pip install -r requirements.txt
```

### 4. Launch the workshop notebooks
```
jupyter notebook
```

> 📌 Make sure you download the **BDD100K dataset** or load it programmatically, and be sure you add yout HuggingFace Hub Token here:

```python
import os
os.environ['HUGGING_FACE_HUB_TOKEN'] = "YOUR_TOKEN_HERE"

import fiftyone.utils.huggingface as fouh 
dataset = fouh.load_from_hub("dgural/bdd100k", persistent=True, name= "bdd10k")
```

---

## 🛠 Requirements

- Python 3.8+
- Internet access for downloading models and datasets
- HuggingFace Hub Token for downloading the dataset
- GPU recommended for model inference (optional)
- Install requirements.txt from this repo

---

## 🔧 Optional: Run the Workshop with Docker

If you prefer to install everything in an isolated containerized environment, you can use Docker to set up and run the workshop. Follow the instructions in this [DOCKER_SETUP.md](DOCKER_SETUP.md)


## 🧠 Technologies Used

- [FiftyOne](https://voxel51.com/fiftyone/) for visual dataset curation and evaluation
- [OpenAI CLIP](https://github.com/openai/CLIP) for semantic search
- [Ultralytics](https://github.com/ultralytics/ultralytics) for object detection
- [BDD100K](https://bdd-data.berkeley.edu/) as the mobility dataset

---

## 📬 Questions?

Feel free to open an issue or reach out via [Voxel51 Community](https://discord.com/invite/fiftyone-community).

Enjoy the workshop! 🎉
