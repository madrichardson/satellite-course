FROM jupyter/base-notebook:python-3.10

# Switch to root to install system dependencies
USER root

# Install Chromium and its dependencies
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

# Switch back to default user
USER $NB_UID

# Install required Python packages
RUN pip install --upgrade pip && pip install \
    selenium \
    python-pptx \
    Pillow \
    requests \
    pandas \
    matplotlib \
    seaborn \
    webdriver-manager

# Copy your notebook into the container
COPY new_create_ppt_DR.ipynb /home/jovyan/

# Set working directory
WORKDIR /home/jovyan/

CMD ["start-notebook.sh"]
