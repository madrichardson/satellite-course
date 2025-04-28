# Start from Binder's base image
FROM jupyter/base-notebook

# Set working directory
WORKDIR /home/jovyan

# Install system packages
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
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
    unzip \
    chromium-browser \
    chromium-chromedriver \
    && rm -rf /var/lib/apt/lists/*

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
