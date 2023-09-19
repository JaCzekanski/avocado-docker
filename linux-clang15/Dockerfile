FROM ubuntu:22.04
LABEL maintainer="ja.czekanski"

ENV CLANG_VER=15

# Download compilers 
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt -qq update && \
    apt -qq install --no-install-recommends -y clang-$CLANG_VER musl ccache git wget ca-certificates make unzip file libsdl2-dev > /dev/null && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$CLANG_VER 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$CLANG_VER 100 

# Add Premake5
COPY --from=avocadoemu/premake /usr/bin/premake5 /usr/bin/premake5
