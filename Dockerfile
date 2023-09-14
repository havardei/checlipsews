FROM braughtg/vnc-novnc-base:1.2.1 
#FROM lauri3k/alpine-xfce4:latest
#COPY script.js /opt/noVNC/script.js
USER root
RUN usermod -u 1234 student
# Node 16
ARG NODE_MAJOR=16

RUN sudo mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

RUN sudo apt-get update
RUN sudo apt-get install -y nodejs

ENV VSCODE_NODEJS_RUNTIME_DIR="/usr/bin"

USER student

