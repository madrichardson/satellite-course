# Start from a base image
FROM ubuntu:22.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install basic utilities
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    unzip \
    supervisor \
    fluxbox \
    xterm \
    xvfb \
    x11vnc \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-wheel \
    python3-numpy \
    python3-pandas \
    python3-scipy \
    python3-matplotlib \
    python3-sklearn \
    python3-seaborn \
    python3-requests \
    python3-yaml \
    python3-pil \
    chromium-browser \
    chromium-driver \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install any Python packages
RUN pip3 install --no-cache-dir \
    jupyterlab \
    selenium \
    voila

# Set up a default user
RUN useradd -m -s /bin/bash jovyan
USER jovyan
WORKDIR /home/jovyan

# Expose default ports (optional for Binder)
EXPOSE 8888

# Default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
