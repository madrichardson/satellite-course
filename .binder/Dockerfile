# Start from Binder's base image
FROM jupyter/base-notebook

# Set working directory
WORKDIR /home/jovyan

# Install system packages
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    gnupg \
    ca-certificates \
    fluxbox \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    xterm \
    supervisor \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Chromium manually (non-snap)
RUN wget -q https://github.com/ungoogled-software/ungoogled-chromium-debian/releases/download/117.0.5938.92-1/ungoogled-chromium_117.0.5938.92-1.debian_amd64.deb && \
    apt install -y ./ungoogled-chromium_117.0.5938.92-1.debian_amd64.deb && \
    rm ./ungoogled-chromium_117.0.5938.92-1.debian_amd64.deb

# Install matching Chromedriver manually
RUN wget -q https://chromedriver.storage.googleapis.com/117.0.5938.92/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver && \
    rm chromedriver_linux64.zip

# Install Python packages
RUN pip install selenium python-pptx pandas Pillow requests seaborn matplotlib

# Set environment variables
ENV DISPLAY=:1
ENV NO_VNC_PORT=6080
EXPOSE 6080

# Copy all files into /home/jovyan
COPY --chown=${NB_UID}:${NB_GID} . /home/jovyan/

# Set up start script
RUN chmod +x /home/jovyan/.binder/start.sh

# Switch back to jovyan user
USER $NB_UID

# Start everything
CMD ["/home/jovyan/.binder/start.sh"]
