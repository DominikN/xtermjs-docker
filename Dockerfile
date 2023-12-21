FROM ubuntu:22.04

RUN apt update && apt install -y \
        curl

RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.4/ttyd.i686 -o /usr/bin/ttyd && \
    chmod +x /usr/bin/ttyd
