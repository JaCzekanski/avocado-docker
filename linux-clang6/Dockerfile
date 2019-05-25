FROM ubuntu:18.04
LABEL maintainer="ja.czekanski"

ENV PREMAKE_VER=5.0.0-alpha13
ENV CLANG_VER=6.0

# Download compilers 
RUN apt-get -qq update && \
    apt-get -qq -y full-upgrade && \
    apt-get install -qq --no-install-recommends -y clang-$CLANG_VER ccache git wget ca-certificates make unzip && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$CLANG_VER 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$CLANG_VER 100 

# Download and build Premake
RUN mkdir -p /home/build && \
    cd /home/build && \
    wget -nv -O premake.zip https://github.com/premake/premake-core/releases/download/v$PREMAKE_VER/premake-$PREMAKE_VER-src.zip && \
    unzip -q premake.zip && \
    cd premake-$PREMAKE_VER/build/gmake.unix && \
    make config=release -j4 && \
    cd ../../../ && \
    cp premake-$PREMAKE_VER/bin/release/premake5 /usr/bin/premake5 && \
    rm -r premake-$PREMAKE_VER && \
    rm premake.zip




