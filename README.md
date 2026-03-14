# NOVA Bootloader 🚀

A minimalist 16-bit x86 bootloader written in NASM Assembly. This project demonstrates how to take control of the CPU immediately after the BIOS POST (Power-On Self-Test) sequence.

## 🛠️ Technical Specifications
- **Architecture:** x86 (16-bit Real Mode)
- **Origin Address:** `0x7C00` (Standard BIOS boot offset)
- **Video Mode:** VGA Mode 3 (80x25 Text Mode)

## 🧩 How it Works
1. **CLI (Clear Interrupts):** Disables maskable hardware interrupts to ensure the setup process isn't interrupted.
2. **Video Initialization:** Uses BIOS Interrupt `0x10` with `AX=0x0003` to clear the screen and set a standard color text environment.
3. **Boot Signature:** Includes the mandatory `0xAA55` magic number at the 510th byte to signal to the BIOS that this drive is bootable.

## 🚀 How to Build and Run

### 1. Prerequisites
You will need the **NASM** assembler and an emulator like **QEMU** to test the code safely.

### 2. Assemble the Code
Convert the assembly source into a raw binary file:
```bash
nasm -f bin nova.asm -o nova.bin
Run in an Emulator

You can boot your code using QEMU:
Bash

qemu-system-x86_64 -drive format=raw,file=nova.bin

This is a low-level hardware demonstration. It does not contain an OS kernel and is intended for educational research into boot sequences and BIOS interrupts.

