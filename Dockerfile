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

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Set SDK path
ENV PICO_SDK_PATH=/pico-sdk

# Clone Pico SDK
RUN git clone https://github.com/raspberrypi/pico-sdk.git /pico-sdk
RUN cd /pico-sdk && git submodule update --init

# Build the project
RUN mkdir -p build && \
    cd build && \
    cmake .. && \
    make -j4

# Output will be at /app/build/src/keyboard_quantizer.uf2
