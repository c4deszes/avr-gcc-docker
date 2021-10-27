FROM alpine

LABEL version="1.1.0"
LABEL description="Image for building AVR embedded projects"

ARG DEBIAN_FRONTEND=noninteractive

# Install common tools
RUN apk --no-cache add \
      alpine-sdk \
      git \
      curl \
      wget

# Install CMake
ARG cmake_version="3.21.3"
ARG cmake_platform="linux-x86_64"

RUN mkdir /opt/cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}-${cmake_platform}.sh
RUN sh cmake-${cmake_version}-${cmake_platform}.sh --prefix=/opt/cmake --skip-license
ENV PATH "$PATH:/opt/cmake/bin"

# Install Python
RUN apk --no-cache add python3.9

# Install AVR GCC
RUN apk --no-cache add \
      binutils \
      gcc-avr \
      avr-libc \
      avrdude
