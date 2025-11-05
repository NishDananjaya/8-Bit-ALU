# 8-bit ALU Processor with FSM Control (VHDL)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple **8-bit processor-like system** implemented in **VHDL**, consisting of an **ALU**, **8-bit D-Flip-Flop registers**, a **Finite State Machine (FSM)** controller, and a **2-to-1 multiplexer**. The design supports arithmetic/logic operations with optional **accumulation mode**.

---

## Short Description

This project implements a **basic 8-bit processing unit** using VHDL with the following components:

- **ALU**: Performs addition, subtraction, multiplication, division, AND, OR, greater-than, and equality comparison.
- **DFF_8**: 8-bit D-Flip-Flop with asynchronous reset for register storage.
- **FSM**: Controls data flow through 5 states (`init → fetch → process → write → done`) and supports **normal** and **accumulate** modes.
- **MUX21_8**: Selects between fresh input B or accumulated result.

The system can:
- Load two 8-bit operands.
- Perform ALU operations.
- Optionally **accumulate** results (e.g., `A + B`, then `result + C`).
- Output result and carry flag.

---

## Modules Overview

| Entity | Description |
|-------|-------------|
| `ALU` | 8-bit Arithmetic Logic Unit with 8 operations and carry output. |
| `DFF_8` | 8-bit register with clock and asynchronous reset. |
| `FSM` | Finite State Machine controlling data flow and register writes. |
| `mux21_8` | 2-input 8-bit multiplexer for selecting ALU operand B. |

---

## FSM State Diagram

```
init (000)
   ↓ (start=1, acc=0)
fetch_numbers (001) → procc (011) → write_result (100) → init
   ↓ (start=1, acc=1)
accumulate (010) ─────┘
```

- **WRA, WRB**: Write enables for input registers A and B.
- **WRC**: Write enable for result register.
- **SEL**: MUX select (`0` = use B, `1` = use previous result).

---

## ALU Operations (OP Code)

| OP  | Operation |
|-----|----------|
| 000 | A + B |
| 001 | A - B |
| 010 | A × B (lower 8 bits) |
| 011 | A ÷ B (integer, 0 if B=0) |
| 100 | A AND B |
| 101 | A OR B |
| 110 | A > B ? 1 : 0 |
| 111 | A = B ? 1 : 0 |

---

## Ports Summary

### Top-Level Integration (Suggested)
```vhdl
clk, rst, start, acc : in  std_logic
OP                   : in  std_logic_vector(2 downto 0)
DataA_in, DataB_in   : in  std_logic_vector(7 downto 0)
Result_out           : out std_logic_vector(7 downto 0)
Carry_out            : out std_logic
State_out            : out std_logic_vector(2 downto 0)
```

---

## Usage

1. **Normal Mode** (`acc = 0`):  
   Load A and B → Compute → Output result.

2. **Accumulate Mode** (`acc = 1`):  
   First operation stores result → Next operation uses result as operand B.

---

## Synthesis & Simulation

- Written in **VHDL-93**.
- Compatible with **Xilinx ISE**, **Vivado**, **Quartus**, **ModelSim**, **GHDL**.
- No external IP or packages beyond IEEE standard libraries.

---

## Files

- `ALU.vhd` – Arithmetic Logic Unit
- `DFF_8.vhd` – 8-bit D-Flip-Flop
- `FSM.vhd` – Control Finite State Machine
- `mux21_8.vhd` – 2-to-1 8-bit Multiplexer

---

## Author

[Your Name] – FPGA / Digital Design Enthusiast

---

## License

This project is licensed under the **MIT License** – see [LICENSE](LICENSE) for details.

---

> **Note**: This is a **student/educational project**. The ALU carry flag is only valid for **addition** (not updated for other ops). Division by zero returns `x"00"`. Ready for extension (pipelining, more ops, etc.).