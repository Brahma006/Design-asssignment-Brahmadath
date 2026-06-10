

# SR Flip-Flop (RTL) — Verilog Implementation

A synchronous **SR Flip-Flop** implemented in Verilog and synthesized to RTL. Includes full testbench simulation with waveform output.

---



---

## Overview

This project implements a **synchronous SR Flip-Flop** with:

- Active-high synchronous **reset** (`rst`)
- Complementary outputs `q` and `qbar`
- MUX-based next-state logic synthesized into `RTL_MUX` and `RTL_REG_SYNC` primitives

---

## RTL Schematic

<img width="680" height="523" alt="WhatsApp Image 2026-06-10 at 1 46 50 PM" src="https://github.com/user-attachments/assets/19c4d4b2-f0f8-4c22-95e0-31302d744dd3" />

The synthesized schematic consists of four `RTL_MUX` blocks computing the next state for `q` and `qbar`, feeding into two `RTL_REG_SYNC` flip-flop registers clocked by `clk`.

| Block | Function |
|---|---|
| `q_i_0` | Computes intermediate next-state for `q` (reset path) |
| `q_i` | Final MUX selecting next value of `q` based on `s`/`r` |
| `qbar_i_0` | Computes intermediate next-state for `qbar` (set path) |
| `qbar_i` | Final MUX selecting next value of `qbar` based on `s`/`r` |
| `q_reg` | Synchronous register with RST — holds `q` |
| `qbar_reg` | Synchronous register with SET — holds `qbar` |

---

## Ports

| Port | Direction | Width | Description |
|---|---|---|---|
| `clk` | Input | 1-bit | Clock signal |
| `r` | Input | 1-bit | Reset input (SR logic) |
| `s` | Input | 1-bit | Set input (SR logic) |
| `rst` | Input | 1-bit | Synchronous master reset (active-high) |
| `q` | Output | 1-bit | Flip-flop output |
| `qbar` | Output | 1-bit | Complementary output |

---

## Functional Description

The SR Flip-Flop operates on the **positive clock edge**. When `rst` is asserted, `q` is forced to `0` and `qbar` is forced to `1` synchronously. Otherwise, the standard SR logic applies:

- `s=1, r=0` → Set: `q = 1`, `qbar = 0`
- `s=0, r=1` → Reset: `q = 0`, `qbar = 1`
- `s=0, r=0` → Hold: outputs retain previous state
- `s=1, r=1` → **Invalid / Forbidden state**

The RTL uses 2-bit select lines (`S[1:0]`) on each MUX, encoding `{s, r}` combinations to route the correct next-state value.

---

## Simulation Waveform

<img width="1525" height="781" alt="WhatsApp Image 2026-06-10 at 1 46 51 PM" src="https://github.com/user-attachments/assets/9118e28d-a665-430b-883e-a77907812541" />

The testbench (`sr_ff_tb.v`) exercises the following signals:

| Signal | Observed Value (at 55,000 ps) |
|---|---|
| `s_tb` | `1` |
| `r_tb` | `1` |
| `rst_tb` | `0` |
| `clk_tb` | `1` (rising edge) |
| `q_tb` | `X` (unknown — forbidden state `s=r=1`) |
| `qbar_tb` | `X` (unknown — forbidden state `s=r=1`) |

> **Note:** The `X` values on `q` and `qbar` at the cursor (55,000 ps) occur because both `s=1` and `r=1` are simultaneously asserted, placing the flip-flop in its **forbidden/indeterminate state**. This is expected behavior and validates the design's sensitivity to invalid inputs.

---

## File Structure

```
.
├── src/
│   └── sr_ff.v           # SR Flip-Flop RTL source
├── tb/
│   └── sr_ff_tb.v        # Testbench
├── docs/
│   ├── rtl_schematic.png # RTL schematic (Image 1)
│   └── simulation_waveform.png  # Vivado/ModelSim waveform (Image 2)
└── README.md
```

---

## Getting Started

### Prerequisites

- [Xilinx Vivado](https://www.xilinx.com/products/design-tools/vivado.html) or any Verilog simulator (ModelSim, Icarus Verilog, etc.)

### Simulation with Icarus Verilog

```bash
# Compile
iverilog -o sr_ff_sim src/sr_ff.v tb/sr_ff_tb.v

# Run simulation
vvp sr_ff_sim

# View waveform (requires GTKWave)
gtkwave dump.vcd
```

### Simulation with Vivado

1. Create a new RTL project and add `sr_ff.v` as the design source.
2. Add `sr_ff_tb.v` as the simulation source.
3. Run **Behavioral Simulation**.
4. In the waveform window, add `s_tb`, `r_tb`, `rst_tb`, `clk_tb`, `q_tb`, and `qbar_tb`.

---

## Truth Table

| `rst` | `s` | `r` | `q` (next) | `qbar` (next) |
|:---:|:---:|:---:|:---:|:---:|
| 1 | X | X | 0 | 1 |
| 0 | 0 | 0 | Q (hold) | Q̄ (hold) |
| 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | X | X |

> All transitions are registered on the **rising edge of `clk`**.




