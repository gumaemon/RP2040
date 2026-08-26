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

# Clone Pico SDK first
RUN git clone https://github.com/raspberrypi/pico-sdk.git /pico-sdk
RUN cd /pico-sdk && git submodule update --init

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app/

# Set SDK path
ENV PICO_SDK_PATH=/pico-sdk

# Build the project (in /build inside container)
WORKDIR /build
RUN cmake /app && make -j4

# Copy output to /app/output for extraction
RUN mkdir -p /app/output && cp -r /build/src /app/output/

# Output command
CMD ["cp", "-r", "/app/output/src", "/output/"]
