# hobbyOS

A simple 64-bit operating system kernel written in Rust.

## Features

- Boots with a custom bootloader
- Basic interrupt handling (IDT setup)
- Memory management with paging
- Heap allocation
- Basic logging system
- Panic handler

## Requirements

- Rust nightly toolchain
- `llvm-tools-preview` component
- `bootimage` tool

## Building

```bash
# Install required tools
rustup toolchain install nightly
rustup component add rust-src --toolchain nightly
rustup component add llvm-tools-preview
cargo install bootimage

# Build and run
cargo bootimage
qemu-system-x86_64 -drive format=raw,file=target/x86_64-rust_os/debug/bootimage-rust_os.bin
```

## Project Structure

- `src/main.rs`: Main kernel code
- `.cargo/config.toml`: Cargo configuration
- `linker.ld`: Linker script for the kernel

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
