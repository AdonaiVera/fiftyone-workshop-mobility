import os
import fiftyone.utils.huggingface as fouh

# Get token from environment
hf_token = os.getenv("HUGGING_FACE_HUB_TOKEN", "")
if not hf_token:
    raise ValueError("HUGGING_FACE_HUB_TOKEN environment variable not set!")

os.environ["HUGGING_FACE_HUB_TOKEN"] = hf_token

# Load dataset from Hugging Face Hub
print("Downloading BDD100K dataset from Hugging Face...")
dataset = fouh.load_from_hub("dgural/bdd100k", persistent=True, name="bdd100k_test")
print("Dataset successfully loaded into FiftyOne.")
