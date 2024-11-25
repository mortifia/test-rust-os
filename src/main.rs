#![no_main]
#![no_std]

use log::info;
use uefi::prelude::*;
use uefi::mem::memory_map::MemoryType;


#[entry]
fn main() -> Status {
    uefi::helpers::init().unwrap();
    info!("Hello world!");

    if let Some(flag) = uefi::boot_services::get().memory_map().iter().find(|entry| entry.ty == MemoryType::BOOT_SERVICES_DATA) {
        info!("Found BootServicesData at 0x{:x} with size 0x{:x}", flag.physical_start, flag.number_of_pages);
    }
    boot::stall(10_000_000);
    Status::SUCCESS
}