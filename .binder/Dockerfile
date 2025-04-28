# Start from Binder's base image
FROM jupyter/base-notebook

# Set working directory
WORKDIR /home/jovyan

# Install system packages
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

# Install Python packages
RUN pip install selenium python-pptx pandas Pillow requests webdriver-manager seaborn matplotlib

# Set environment variables
ENV DISPLAY=:1
ENV NO_VNC_PORT=6080
EXPOSE 6080

# Copy all repo files into /home/jovyan
COPY --chown=${NB_UID}:${NB_GID} . /home/jovyan/

# Set up VNC and start script
RUN chmod +x /home/jovyan/.binder/start.sh

# Switch back to jovyan user
USER $NB_UID

# Start VNC, noVNC, Fluxbox, and Jupyter
CMD ["/home/jovyan/.binder/start.sh"]
