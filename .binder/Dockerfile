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
    && rm -rf /var/lib/apt/lists/*

# Install real Chromium (not Snap!)
RUN wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    chromium-browser \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install selenium python-pptx pandas Pillow requests webdriver-manager seaborn matplotlib

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
