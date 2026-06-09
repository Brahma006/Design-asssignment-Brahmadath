
# Digital IC Design Internship

A collection of digital design assignments implemented in Verilog HDL, organized by day. Each module includes a design file and a corresponding testbench for simulation and verification.

---

## Repository Structure

```
Design-asssignment-Brahmadath/
├── day1/
│   ├── BCD_Adder/
│   │   ├── design/
│   │   └── bcd_tb.v          
│   └── Ripple_Carry_Adder/
│       ├── design/
│       ├── RC_tb.v            
│       └── rca.md        
│
└── day2/
    ├── 2x4_decoder/
    │   ├── design/
    │   └── tb/
    ├── USR/                   
    │   ├── design/
    │   └── tb/
    ├── dff/
    │   ├── design/
    │   │   └── design.v       
    │   └── tb/
    └── sr_flipflop/
        ├── design/
        └── tb/
```

---

## Modules

### Day 1

#### BCD Adder
A Binary-Coded Decimal (BCD) adder that adds two single-digit BCD numbers and produces a BCD result with carry output. Includes correction logic to keep the sum in valid BCD range (0–9).

#### Ripple Carry Adder (RCA)
A multi-bit ripple carry adder built by chaining full adder units. The carry propagates sequentially from the least significant bit to the most significant bit.

---

### Day 2

#### 2×4 Decoder
A combinational circuit that activates one of four output lines based on a 2-bit input, with an enable signal. Used in memory addressing and demultiplexing applications.

#### Universal Shift Register (USR)
A register capable of parallel load, serial shift left, serial shift right, and hold operations, controlled by a 2-bit mode select input.

#### D Flip-Flop (DFF)
A positive/negative edge-triggered D flip-flop — the fundamental sequential storage element used in registers, counters, and state machines.

#### SR Flip-Flop
A Set-Reset flip-flop with active-high inputs. Demonstrates basic bistable latch behavior with undefined state handling.

---

## Simulation

Each module's testbench can be simulated using any standard Verilog simulator:

```bash
# Using Icarus Verilog (example for Ripple Carry Adder)
iverilog -o rca_sim day1/Ripple_Carry_Adder/RC_tb.v day1/Ripple_Carry_Adder/design/<design_file>.v
vvp rca_sim

# View waveforms (if $dumpfile is used in testbench)
gtkwave dump.vcd
```

---

## Tools

- **Language:** Verilog HDL
- **Simulator:** Icarus Verilog / ModelSim / Vivado
- **Waveform Viewer:** GTKWave

---

## Author

**Brahmadath**  
GitHub: [@Brahma006](https://github.com/Brahma006)
