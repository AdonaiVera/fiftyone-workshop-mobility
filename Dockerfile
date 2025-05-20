# Use an official Python base image with version 3.10
FROM python:3.10-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Create working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy notebooks and startup script
COPY . /workspace
COPY startup.py /workspace/startup.py

# Expose Jupyter and FiftyOne App ports
EXPOSE 8888
EXPOSE 5151

# Run dataset download script and then launch Jupyter
CMD ["sh", "-c", "python /workspace/startup.py && jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.token='' --ServerApp.password='' --ServerApp.root_dir=/workspace"]


