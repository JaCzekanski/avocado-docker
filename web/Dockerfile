FROM ubuntu:18.04
LABEL maintainer="ja.czekanski"

RUN ln -sf /bin/bash /bin/sh

RUN apt -qq update && \
    apt -qq install --no-install-recommends -y git-core xz-utils python nodejs cmake default-jre > /dev/null && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    git clone https://github.com/emscripten-core/emsdk.git && \
    cd /opt/emsdk/ && \
    ./emsdk install latest && \
    ./emsdk activate latest && \
    rm -rf zips/* && \
    echo "source /opt/emsdk/emsdk_env.sh" >> /root/.bashrc

