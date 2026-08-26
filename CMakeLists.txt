cmake_minimum_required(VERSION 3.13)

# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)

project(keyboard_quantizer C CXX ASM)

# Initialize the SDK
pico_sdk_init()

add_subdirectory(src)
