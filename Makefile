.PHONY: build clean flash help

# Build the project
build:
	@echo "Building keyboard_quantizer for RP2040..."
	@mkdir -p build
	@cd build && cmake .. && make -j4
	@echo "✅ Build complete! Output: build/src/keyboard_quantizer.uf2"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf build

# Flash to device
flash: build
	@echo "Ready to flash!"
	@echo "1. Connect Pico with BOOTSEL button pressed"
	@echo "2. Copy: cp build/src/keyboard_quantizer.uf2 /Volumes/RPI-RP2/"
	@echo "   (macOS) or /media/user/RPI-RP2/ (Linux)"

# Help
help:
	@echo "Available targets:"
	@echo "  make build   - Build the project"
	@echo "  make clean   - Clean build artifacts"
	@echo "  make flash   - Flash instructions"
	@echo "  make help    - Show this help message"
