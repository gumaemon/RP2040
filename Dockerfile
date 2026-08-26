FROM ubuntu:22.04

# Install build dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    build-essential \
    git \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Clone Pico SDK
RUN git clone https://github.com/raspberrypi/pico-sdk.git /pico-sdk
RUN cd /pico-sdk && git submodule update --init

# Set SDK path
ENV PICO_SDK_PATH=/pico-sdk

# Set working directory
WORKDIR /build

# Copy project files
COPY . /build/

# Build the project inside the image
RUN rm -rf /build/build && \
    mkdir -p /build/build && \
    cd /build/build && \
    cmake .. && \
    make -j4

# Copy built file to a known location
RUN cp /build/build/src/keyboard_quantizer.uf2 /keyboard_quantizer.uf2

# When run, output the file
CMD ["cat", "/keyboard_quantizer.uf2"]
