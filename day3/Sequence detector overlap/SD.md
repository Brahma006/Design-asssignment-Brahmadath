# Sequence Detector (Verilog HDL)

## Overview
This project implements a **Sequence Detector FSM** in Verilog and was designed and simulated using Xilinx Vivado.

The design contains:
- Clock (`clk`)
- Reset (`rst`)
- Serial input (`din`)
- Detection output (`detected`)

The FSM monitors the serial input stream and asserts the `detected` output whenever the target sequence is recognized.

---

## RTL Schematic

The synthesized RTL schematic is shown below:
<img width="1046" height="519" alt="WhatsApp Image 2026-06-10 at 4 02 01 PM" src="https://github.com/user-attachments/assets/fb441e25-847c-4d08-8efe-33102ab000bc" />


### Description
- State transitions are implemented using synchronous registers.
- Next-state logic is generated using combinational logic.
- Detection logic produces the `detected` output based on the current state and input.
- Reset initializes the FSM to the starting state.

---

## Simulation Results

The waveform obtained from simulation is shown below:
<img width="1544" height="761" alt="WhatsApp Image 2026-06-10 at 4 01 31 PM" src="https://github.com/user-attachments/assets/d76cfe54-54bf-4580-96d6-7ac74f5af72e" />



### Observations
- `clk_tb` provides the system clock.
- `rst_tb` initializes the detector.
- `din_tb` is the serial input sequence.
- `detected_tb` goes HIGH when the desired sequence is detected.

---

## Ports

| Port | Direction | Description |
|--------|-----------|-------------|
| clk | Input | System clock |
| rst | Input | Active-high reset |
| din | Input | Serial data input |
| detected | Output | Sequence detected flag |

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator

---

## How to Run

1. Open the project in Vivado.
2. Add the Verilog source file(s).
3. Add the testbench.
4. Run **Behavioral Simulation**.
5. Run **Synthesis**.
6. Open the RTL schematic and verify the generated hardware.




