FROM openjdk:8
LABEL maintainer="ja.czekanski"

ENV SDK_URL=https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip
ENV NDK_URL=https://dl.google.com/android/repository/android-ndk-r23b-linux.zip

ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_NDK_ROOT=/opt/android-ndk-r23b

ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_NDK_ROOT}:${PATH}"

# Download Android SDK
RUN wget -q -O sdk.zip $SDK_URL && \
    mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    unzip -qq sdk.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools && \
    rm sdk.zip

# Download Android NDK
RUN wget -q -O ndk.zip $NDK_URL && \
   unzip -qq ndk.zip -d /opt/ && \
   rm ndk.zip

# Add Android licenses
RUN mkdir $ANDROID_SDK_ROOT/licenses && \
    echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > $ANDROID_SDK_ROOT/licenses/android-sdk-license && \
    echo d56f5187479451eabf01fb78af6dfcb131a6481e >> $ANDROID_SDK_ROOT/licenses/android-sdk-license && \
    echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> $ANDROID_SDK_ROOT/licenses/android-sdk-license && \
    echo 84831b9409646a918e30573bab4c9c91346d8abd > $ANDROID_SDK_ROOT/licenses/android-sdk-preview-license

# Update and install using sdkmanager
RUN sdkmanager "build-tools;29.0.3" "platforms;android-30" > /dev/null

# Install musl (for premake5) and missing tools for NDK
RUN apt update -qq && \
    apt install -qq --no-install-recommends -y musl ccache file make > /dev/null && \
    rm -rf /var/lib/apt/lists/* 

# Add Premake5
COPY --from=avocadoemu/premake /usr/bin/premake5 /usr/bin/premake5
