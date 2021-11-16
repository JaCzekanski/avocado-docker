FROM ubuntu:18.04
LABEL maintainer="ja.czekanski"

ARG VERSION=2.0.33

RUN ln -sf /bin/bash /bin/sh

RUN apt -qq update && \
    apt -qq install --no-install-recommends -y ca-certificates musl git-core xz-utils python make libxml2 > /dev/null && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    git clone https://github.com/emscripten-core/emsdk.git && \
    cd /opt/emsdk/ && \
    ./emsdk install ${VERSION} && \
    ./emsdk activate ${VERSION} && \
    emcc -s USE_SDL=2 /dev/null &> /dev/null || true && \
    rm -rf zips/* && \
    echo "source /opt/emsdk/emsdk_env.sh" >> /root/.bashrc

# Add Premake5
COPY --from=avocadoemu/premake /usr/bin/premake5 /usr/bin/premake5
