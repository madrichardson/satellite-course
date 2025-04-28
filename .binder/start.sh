#!/bin/bash

# Start virtual display
Xvfb :1 -screen 0 1280x800x16 &

# Start lightweight desktop
fluxbox &

# Start VNC server
x11vnc -display :1 -nopw -forever &

# Start noVNC
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

# Finally, start the Jupyter Notebook server
start-notebook.sh --NotebookApp.token=''
