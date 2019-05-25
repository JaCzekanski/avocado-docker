FROM avocadoemu/linux-clang6:latest
LABEL maintainer="ja.czekanski"

ENV SDK_URL=https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
ENV NDK_URL=https://dl.google.com/android/repository/android-ndk-r19c-linux-x86_64.zip

ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_NDK=/opt/android-ndk-r19c

ENV PATH="${ANDROID_SDK_ROOT}/tools/bin:${ANDROID_NDK}:${PATH}"

RUN apt-get -qq update && \
    apt-get install -qq --no-install-recommends -y openjdk-8-jdk-headless file && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O sdk.zip $SDK_URL && \
    unzip -qq sdk.zip -d /opt/android-sdk && \
    rm sdk.zip

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
RUN sdkmanager "platform-tools" "build-tools;28.0.3" "platforms;android-28"