#!/bin/bash

abort()
{
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e # Exit on error 

./script/build.sh;

qemu-system-x86_64 -enable-kvm \
    -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
    -drive if=pflash,format=raw,readonly=on,file=OVMF_VARS.fd \
    -drive format=raw,file=fat:rw:esp;

trap : 0

echo "Success!"