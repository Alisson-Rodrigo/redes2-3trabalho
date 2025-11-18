FROM ubuntu:22.04

RUN apt update && apt install -y \
    nginx \
    apache2 \
    curl \
    wget \
    nano \
    net-tools

EXPOSE 80
