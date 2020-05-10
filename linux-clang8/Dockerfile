FROM ubuntu:19.04
LABEL maintainer="ja.czekanski"

ENV CLANG_VER=8

# Download compilers 
RUN sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get -qq update && \
    apt-get install -qq --no-install-recommends -y clang-$CLANG_VER musl ccache git wget ca-certificates make unzip libsdl2-dev > /dev/null && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$CLANG_VER 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$CLANG_VER 100 

# Add Premake5
COPY --from=avocadoemu/premake /usr/bin/premake5 /usr/bin/premake5
