add_executable(keyboard_quantizer
    blink.c
)

# Pull in common dependencies
target_link_libraries(keyboard_quantizer pico_stdlib)

# Create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(keyboard_quantizer)
