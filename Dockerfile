FROM alpine

LABEL version="1.2.0"
LABEL description="Image for building AVR embedded projects"

ARG DEBIAN_FRONTEND=noninteractive
ARG AVR_GCC_VERSION="10.2.0"

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
      gcc-avr=${AVR_GCC_VERSION}-r0 \
      avr-libc \
      avrdude

WORKDIR /usr/temp

# Install Atmega DFP
RUN wget http://packs.download.atmel.com/Atmel.ATmega_DFP.1.7.374.atpack
RUN unzip Atmel.ATmega_DFP.1.7.374.atpack -d ATmega_DFP
RUN cp -r ATmega_DFP/include/* /usr/avr/include/
RUN cp -r ATmega_DFP/gcc/dev/*/device-specs/* /usr/lib/gcc/avr/${AVR_GCC_VERSION}/device-specs/

# Install Attiny DFP
RUN wget http://packs.download.atmel.com/Atmel.ATtiny_DFP.1.10.348.atpack
RUN unzip Atmel.ATtiny_DFP.1.10.348.atpack -d ATtiny_DFP
RUN cp -r ATtiny_DFP/include/* /usr/avr/include/
RUN cp -r ATtiny_DFP/gcc/dev/*/device-specs/* /usr/lib/gcc/avr/${AVR_GCC_VERSION}/device-specs/
RUN cp -r ATtiny_DFP/gcc/dev/*/avr* /usr/lib/gcc/avr/${AVR_GCC_VERSION}/

ENTRYPOINT [ "/bin/bash" ]
