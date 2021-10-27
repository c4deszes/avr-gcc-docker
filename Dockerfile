FROM alpine

LABEL version="1.1.0"
LABEL description="Image for building AVR embedded projects"

ARG DEBIAN_FRONTEND=noninteractive

# Install common tools
RUN apk --no-cache add \
      alpine-sdk \
      bash \
      git \
      curl \
      wget

# Install Python
RUN apk add --update python3 py3-pip

# Install AVR GCC
RUN apk --no-cache add \
      binutils \
      make \
      cmake \
      gcc-avr \
      avr-libc \
      avrdude

ENTRYPOINT [ "/bin/bash" ]
