FROM alpine:3.14 as build
LABEL maintainer="ja.czekanski"

ENV PREMAKE_VER=5.0.0-beta1

# Download compilers 
RUN apk add --no-cache gcc musl-dev ca-certificates make wget unzip

# Download and build Premake
RUN mkdir /build && \
    cd /build && \
    wget -nv -O premake.zip https://github.com/premake/premake-core/releases/download/v$PREMAKE_VER/premake-$PREMAKE_VER-src.zip && \
    unzip -q premake.zip && \
    cd premake-$PREMAKE_VER-src/build/gmake2.unix && \
    make config=release -j4 > /dev/null && \
    cd ../../../ && \
    cp premake-$PREMAKE_VER-src/bin/release/premake5 /usr/bin/premake5 && \
    rm -r premake-$PREMAKE_VER-src && \
    rm premake.zip

FROM alpine:3.14
COPY --from=build /usr/bin/premake5 /usr/bin/premake5