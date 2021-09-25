FROM ubuntu

LABEL version="1.0.0"
LABEL description="Image for building AVR embedded projects"

# Install common tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
      build-essential \
      git \
      curl \
      wget

# Install CMake
ARG cmake_version="3.20.2"
ARG cmake_platform="linux-x86_64"

RUN mkdir /opt/cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}-${cmake_platform}.sh
RUN sh cmake-${cmake_version}-${cmake_platform}.sh --prefix=/opt/cmake --skip-license
ENV PATH "$PATH:/opt/cmake/bin"

# Install Python
RUN apt-get install -y python3.9

# Install AVR GCC
RUN apt-get install -y \
      binutils \
      gcc-avr \
      avr-libc \
      avrdude
