FROM jupyter/scipy-notebook:latest

# Install required packages
USER root
RUN apt-get update && apt-get install -y \
    chromium-driver \
    chromium-browser \
    xvfb \
    unzip \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1 \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    fonts-liberation \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libasound2 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
USER jovyan
RUN pip install --upgrade pip && pip install \
    selenium \
    webdriver-manager \
    python-pptx \
    pillow \
    requests \
    pandas
