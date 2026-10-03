# 02 — 4:1 MUX and 1:4 DEMUX

Combinational routing circuits implemented using Verilog dataflow logic.

## MUX
`S1S0 = 00 → I0,;01 → I1,;10 → I2,;11 → I3`

## DEMUX
Input `D` is routed to one output selected by `S1S0`.

## Verification
Exhaustive testbenches cover all 64 MUX combinations and all 8 DEMUX combinations.

![MUX waveform](../docs/waveforms/mux_4to1_tb.png)
