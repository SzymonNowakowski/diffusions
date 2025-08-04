# Base: Latest PyTorch GPU container from NVIDIA NGC (Aug 2025)
FROM nvcr.io/nvidia/pytorch:25.06-py3

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory inside container. Do not copy the codebase, though!
WORKDIR /workspace


# Install useful system packages:
# - libgl1: Provides OpenGL support, required by OpenCV
# - cleanup: reduce image size after apt-get
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
 && rm -rf /var/lib/apt/lists/* \

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install ML/data/image libraries for diffusion work
RUN pip install --upgrade \
    einops \
    tqdm \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    imageio \
    opencv-python-headless \
    scikit-learn \
    scikit-image


# Default shell
CMD ["/bin/bash"]