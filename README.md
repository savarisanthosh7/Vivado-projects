# Vivado Projects — Digital Design in Verilog

A structured collection of Verilog RTL projects for practicing combinational logic, sequential logic, finite-state machines, simulation, and FPGA-oriented verification.

## Projects

| # | Project | Design type | Verification |
|---|---|---|---|
| 01 | Adders | Combinational / structural | Exhaustive testbenches |
| 02 | 4:1 MUX & 1:4 DEMUX | Combinational | Exhaustive testbenches |
| 03 | T Flip-Flop | Sequential | Reference-model testbench |
| 04 | Moore 1011 Detector | Moore FSM | Directed + random checking |
| 05 | Parking Lot Controller | FSM + counter | Capacity/entry/exit scenarios |
| 06 | Vending Machine | Moore FSM | Multiple transaction scenarios |

## Repository structure

```
Vivado-projects/
├── 01_adders/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
├── 02_mux_demux/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
├── 03_t_flipflop/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
├── 04_moore_1011_detector/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
├── 05_parking_lot_controller/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
├── 06_vending_machine/
│   ├── rtl/
│   ├── testbench/
│   └── README.md
└── docs/waveforms/
```

## Tools

- Verilog HDL
- Xilinx Vivado
- Icarus Verilog
- VCD-compatible waveform viewers

## Verification

The testbenches automatically compare DUT outputs against expected behavior. Generated Vivado build files and simulation artifacts should remain untracked through `.gitignore`.

## Author

**Santhosh** — Electronics & Communication Engineering

Released under the MIT License.
