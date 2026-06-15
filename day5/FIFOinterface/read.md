# Day 6 – Task 1: FIFO Verification Using SystemVerilog Interface
 
## Objective
 
To verify a **Synchronous FIFO (First-In First-Out)** memory design using a **SystemVerilog Interface** and demonstrate how interfaces streamline signal management between the DUT (Design Under Test) and the testbench.
 
---
 
# Introduction
 
A FIFO is a fundamental hardware component used for buffering data between modules operating at different rates or in different clock domains. Verifying a FIFO requires monitoring multiple control signals simultaneously — including write enable, read enable, full, empty, and data lines.
 
In traditional Verilog testbenches, each of these signals must be wired individually, increasing the risk of connection errors as design complexity grows.
 
SystemVerilog introduces the concept of an **Interface**, which bundles all related signals into a single reusable construct. This task verifies a **Synchronous FIFO** design using an Interface-based testbench, demonstrating improved signal organization and verification efficiency.
 
---
 
# Theory
 
## What is a FIFO?
 
A FIFO (First-In First-Out) is a memory buffer where the first data written is the first data read out. It is commonly used for:
 
* Data buffering between producer and consumer modules
* Clock domain crossing (asynchronous FIFOs)
* Communication between processors and peripherals
### FIFO Control Signals
 
| Signal   | Direction | Description                          |
| -------- | --------- | ------------------------------------ |
| clk      | Input     | Clock signal                         |
| rst      | Input     | Reset (clears FIFO)                  |
| wr\_en   | Input     | Write Enable                         |
| rd\_en   | Input     | Read Enable                          |
| data\_in | Input     | Data to be written into FIFO         |
| data\_out| Output    | Data read from FIFO                  |
| full     | Output    | High when FIFO is full               |
| empty    | Output    | High when FIFO is empty              |
 
## What is a SystemVerilog Interface?
 
An Interface is a named bundle of signals declared outside the module. It allows both the DUT and testbench to access the same set of signals through a single connection point.
 
### Advantages
 
* Reduces wiring complexity across large designs
* Improves code readability and maintainability
* Simplifies DUT-Testbench connections
* Supports modport-based directional control
* Enables reuse across multiple verification components
* Foundation of UVM-based environments
---
 
# FIFO Design Overview
 
The FIFO design is a **Synchronous FIFO** implemented using a circular buffer with read and write pointers.
 
### Parameters
 
| Parameter  | Default Value | Description              |
| ---------- | ------------- | ------------------------ |
| DATA\_WIDTH | 8            | Width of each data word  |
| DEPTH       | 8            | Number of entries in FIFO|
| ADDR\_WIDTH | 3            | Address bits (log2 DEPTH)|
 
### Inputs
 
| Signal       | Width  | Description           |
| ------------ | ------ | --------------------- |
| clk          | 1-bit  | Clock signal          |
| rst          | 1-bit  | Synchronous Reset     |
| wr\_en       | 1-bit  | Write Enable          |
| rd\_en       | 1-bit  | Read Enable           |
| data\_in     | 8-bit  | Input data            |
 
### Outputs
 
| Signal    | Width | Description           |
| --------- | ----- | --------------------- |
| data\_out | 8-bit | Output data           |
| full      | 1-bit | FIFO Full flag        |
| empty     | 1-bit | FIFO Empty flag       |
 
---
 
# Interface Declaration
 
The interface groups all FIFO signals into a single structure with `modport` definitions to enforce directionality.
 
### Signals Included
 
| Signal    | Description           |
| --------- | --------------------- |
| clk       | Clock                 |
| rst       | Reset                 |
| wr\_en    | Write Enable          |
| rd\_en    | Read Enable           |
| data\_in  | Write Data            |
| data\_out | Read Data             |
| full      | Full Flag             |
| empty     | Empty Flag            |
 

 
# Design Methodology
 
The verification environment consists of the following components:
 
### 1. Interface (`fifo_if`)
 
Bundles all FIFO signals and defines modports for DUT and testbench.
 
### 2. DUT (`fifo`)
 
Synchronous FIFO design under test.
 
# RTL Analysis
 
The FIFO RTL consists of three main functional blocks:
 
* **Write Logic** — Manages the write pointer and data storage on `wr_en`
* **Read Logic** — Manages the read pointer and data output on `rd_en`
* **Flag Logic** — Generates `full` and `empty` flags based on pointer comparison
### RTL Diagram

<img width="1600" height="835" alt="image" src="https://github.com/user-attachments/assets/5b28cef8-9384-4c4d-a0b7-37d635a9ece2" />


 
