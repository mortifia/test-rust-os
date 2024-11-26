#!/bin/bash
set -e # Exit on error

cargo build --target x86_64-unknown-uefi;

mkdir -p esp/efi/boot;

cp target/x86_64-unknown-uefi/debug/ring_os.efi esp/efi/boot/bootx64.efi;