FROM ubuntu:20.04
LABEL maintainer="ja.czekanski"

ENV CLANG_VER=10

# Download compilers 
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends -y clang-$CLANG_VER musl ccache git wget ca-certificates make unzip libsdl2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$CLANG_VER 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$CLANG_VER 100 

# Add Premake5
COPY --from=avocadoemu/premake /usr/bin/premake5 /usr/bin/premake5
