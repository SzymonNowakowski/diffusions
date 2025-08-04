
# Diffusions: PyTorch + Image Dataset Docker Environment

This Docker container provides a GPU-ready, minimal environment for PyTorch-based diffusion models and image dataset workflows. It is based on the latest NVIDIA PyTorch container (`25.06-py3`) and includes key scientific Python libraries — without bundling any code.

## Build the Docker Image

```bash
docker build -t diffusions .
```


## Push to Docker Hub

```bash
# Tag the image for Docker Hub
docker tag diffusions snowakowski/diffusions:latest
docker tag diffusions snowakowski/diffusions:2025-08-4

# Push to your Docker Hub repository
docker push snowakowski/diffusions:latest
docker push snowakowski/diffusions:2025-08-4
```
Make sure you are logged in:

```bash
docker login
```

## Run the Container with Mounted Code

Assume your host directory looks like this:

```
project/
├── code/
│   └── train.py
└── data/
    └── images/
```

Then run:

```bash
docker run --gpus all --rm -v $(pwd):/workspace snowakowski/diffusions:latest python code/train.py
```

This will:
- Mount your current working directory into `/workspace` inside the container
- Run `python code/train.py` immediately

## Directory Layout (Inside Container)

| Host Path        | Container Path        |
|------------------|------------------------|
| `./code/`        | `/workspace/code/`     |
| `./data/`        | `/workspace/data/`     |

In your Python code, you can access files like:

```python
from pathlib import Path
image_dir = Path("data/images")
```

## Notes

- No code is copied into the container — use volume mounts to keep it clean and modular.
- Designed for training scripts, dataset processing, and experimentation with diffusion models.

