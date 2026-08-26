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
WORKDIR /workspace

# Copy project files
COPY . /workspace/

# Build the project
RUN rm -rf /workspace/build && \
    mkdir -p /workspace/build && \
    cd /workspace/build && \
    cmake .. && \
    make -j4
