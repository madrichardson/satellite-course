FROM jupyter/base-notebook:python-3.10

USER root
ENV DEBIAN_FRONTEND=noninteractive

# Install Chromium and dependencies
RUN apt-get update && apt-get install -y \
    chromium-browser \
    chromium-driver \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libxss1 \
    libasound2 \
    libxshmfence1 \
    libgbm-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

# Install required Python packages
RUN pip install --upgrade pip && pip install \
    selenium \
    python-pptx \
    Pillow \
    requests \
    pandas \
    matplotlib \
    webdriver-manager

# Copy your notebook
COPY new_create_ppt.ipynb /home/jovyan/

# Set working directory
WORKDIR /home/jovyan/

# Start Jupyter (manual execution)
CMD ["start-notebook.sh"]
