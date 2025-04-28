# Start from official Binder base
FROM jupyter/base-notebook

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

# Install required Python packages
RUN pip install selenium python-pptx pandas Pillow requests webdriver-manager

# Set environment variables
ENV DISPLAY=:1
ENV NO_VNC_PORT=6080

# Expose ports for noVNC
EXPOSE 6080

# Switch back to jovyan user
USER $NB_UID

# Create VNC and fluxbox startup script
RUN mkdir -p /home/jovyan/.vnc

COPY .binder/start.sh /home/jovyan/start.sh
RUN chmod +x /home/jovyan/start.sh

CMD ["/home/jovyan/start.sh"]
