
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

# Install Python packages
RUN pip install selenium python-pptx pandas Pillow requests webdriver-manager

# Environment variables
ENV DISPLAY=:1
ENV NO_VNC_PORT=6080

EXPOSE 6080

# Still as root:
# Copy start.sh and set executable permissions
COPY --chown=jovyan:users .binder/start.sh /home/jovyan/start.sh
RUN chmod +x /home/jovyan/start.sh

# Now back to jovyan user
USER $NB_UID

# Start VNC + Desktop + Jupyter
CMD ["/home/jovyan/start.sh"]
