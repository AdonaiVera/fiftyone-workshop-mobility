# 🐳 Getting Started with Docker for the FiftyOne Mobility Workshop

This guide will help you set up the entire environment using Docker, from installation to running the notebooks with the BDD100K dataset.

---

## ✅ Step 1: Install Docker

Follow the official instructions based on your operating system:

- **macOS:** https://docs.docker.com/desktop/install/mac-install/
- **Windows:** https://docs.docker.com/desktop/install/windows-install/
- **Linux (Ubuntu):**
  ```bash
  sudo apt-get update
  sudo apt-get install docker.io
  sudo systemctl enable docker
  sudo systemctl start docker
  ```

You can verify the installation with:
```bash
docker --version
```

---

## 📁 Step 2: Clone the Repository

```bash
git clone https://github.com/your-org/fiftyone-mobility-workshop.git
cd fiftyone-mobility-workshop
```

Make sure the following files are present:
- `Dockerfile`
- `requirements.txt`
- `startup.py`
- `01_dataset_exploration_enhanced.ipynb`
- `02_similarity_embeddings_enhanced.ipynb`
- `03_model_evaluation_enhanced.ipynb` 


---

## 🔐 Step 3: Get Your Hugging Face Token

To download datasets from Hugging Face, you need an access token.

1. Go to [https://huggingface.co/settings/tokens](https://huggingface.co/settings/tokens)
2. Create a new **Read** token
3. Save it for use in the next step

---

## 🛠 Step 4: Build the Docker Image

This step builds the container with Python 3.10, installs all dependencies, and prepares everything for execution.

```bash
docker build -t fiftyone-bdd100k .
```

---

## 🚀 Step 5: Run the Container

```bash
docker run -p 8888:8888 -p 5151:5151 \
  -e HUGGING_FACE_HUB_TOKEN=your_hf_token_here \
  fiftyone-bdd100k
```

This will:
- Authenticate with Hugging Face
- Download the BDD100K dataset into `/workspace`
- Launch Jupyter Notebook on port `8888`
- Open `5151` port to expose FiftyOne App properly.

Open your browser and go to:
```
http://localhost:8888
```

---

## ✏️ Optional: Modify the `startup.py` Script

You can modify `startup.py` to:
- Download different splits
- Load other datasets
- Set up environment variables
- Add custom processing

Example:
```python
dataset = fouh.load_from_hub("dgural/bdd100k", split="train", persistent=True, name="bdd100k_train")
```

---

## 🧹 Optional: Clean Up Docker Resources

To remove the container after you're done:
```bash
docker ps -a   # Find container ID
docker rm <container_id>
```

To remove the image:
```bash
docker rmi fiftyone-bdd100k
```

---

## 💬 Need Help?

Open an issue in the repository or reach out via [Voxel51 Community](https://discord.com/invite/fiftyone-community).

