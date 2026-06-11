# TASK -4 Block Memory Generator — 8×8 Modelling (Verilog)
 

 
## Overview
 
This project models a **Block RAM (BRAM)** with the following specifications:
 
| Parameter        | Value         |
|-----------------|---------------|
| Memory Depth     | 8 locations   |
| Data Width       | 8 bits        |
| Address Width    | 3 bits        |
| Write Mode       | Synchronous   |
| Read Mode        | Synchronous   |
| Reset            | Asynchronous, Active-High |
 
The design uses a **single write-enable signal (`wenb`)** to select between write and read operations:
- `wenb = 1` → **Write** to `write_address`
- `wenb = 0` → **Read** from `read_address`
---
 
## Block Diagram
 
```
         ┌─────────────────────┐
  CLK ──▶│                     │
 arst_a ▶│                     │
  wenb ──▶│     Block RAM       ├──▶ data_out [7:0]
  write_  │       8 × 8         │
  address▶│                     │
  read_   │                     │
  address▶│                     │
 data_in ▶│                     │
  [7:0]   └─────────────────────┘
```
---
 

 
## RTL Schematic
 
The synthesised RTL schematic (Vivado) shows:
 
- **8 × `RTL_ROM` blocks** — representing the individual memory register cells
- **8 × `RTL_MUX`** — write-address decode multiplexers (selecting which cell to update)
- **8 × `RTL_REG_ASYNC`** — async-reset D flip-flop registers holding each memory word
- **1 × output `RTL_MUX` + `RTL_REG_ASYNC`** — read-address mux and registered output

 
<img width="1595" height="835" alt="Screenshot 2026-06-11 142605" src="https://github.com/user-attachments/assets/8386bd4e-e8c0-4a78-9029-cf64b4657db5" />

 
---
 
## Simulation Results
 
Functional simulation performed in **Vivado Behavioral Simulation**.
 
### Waveform Summary
 
| Time (ns) | wenb | write_addr | read_addr | data_in | data_out | Operation          |
|-----------|------|-----------|-----------|---------|----------|--------------------|
| 0–10      | 0    | 0         | 0         | 0x00    | `xx`     | Reset / Initial    |
| 10–30     | 1    | 0→2       | 0         | 0x00→0xa5 | 0x00  | **Write phase**    |
| 30–50     | 1    | 2         | 2         | 0xa5    | 0xa5     | Write + Read back  |
| 50–85     | 0    | 6         | 6         | 0x5c    | 0x5c     | **Read phase**     |
 
<img width="1601" height="850" alt="Screenshot 2026-06-11 142458" src="https://github.com/user-attachments/assets/23f29e45-7db1-4566-a52b-b25751f7e800" />

 

 

 

 

