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
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y /tmp/google-chrome.deb && \
    rm /tmp/google-chrome.deb

# Install Chromedriver matching Chrome version
RUN LATEST=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${LATEST}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip && \
    chmod +x /usr/local/bin/chromedriver

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
