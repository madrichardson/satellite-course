# Start from Binder's base image
FROM jupyter/base-notebook

# Set the working directory early so everything is inside /home/jovyan
WORKDIR /home/jovyan

# Install system packages for browser and GUI
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium-browser \
    xvfb \
    fluxbox \
    x11vnc \
    novnc \
    websockify \
    xterm \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages required for your notebook
RUN pip install selenium python-pptx pandas Pillow requests webdriver-manager

# Set environment variables
ENV DISPLAY=:1
ENV NO_VNC_PORT=6080
EXPOSE 6080

# Set up VNC and start script
RUN mkdir -p /home/jovyan/.vnc
COPY .binder/start.sh /home/jovyan/start.sh
RUN chmod +x /home/jovyan/start.sh

# Switch back to jovyan user (not root)
USER $NB_UID

# Start VNC, noVNC, Fluxbox, and Jupyter
CMD ["/home/jovyan/start.sh"]
