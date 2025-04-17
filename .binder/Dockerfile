FROM jupyter/scipy-notebook:latest

# Install system packages for Chrome + ChromeDriver + headless display
USER root
RUN apt-get update && apt-get install -y \
    chromium-browser \
    chromium-driver \
    xvfb \
    unzip \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1 \
    libxss1 \
    libappindicator1 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libasound2 \
    libgbm1 \
    fonts-liberation \
    libu2f-udev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Return to notebook user
USER ${NB_UID}

# Install Python packages
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        selenium \
        webdriver-manager \
        python-pptx \
        pillow \
        requests \
        pandas
