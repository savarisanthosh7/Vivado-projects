# 01 — Adders

Hierarchical Verilog implementation of half adder, full adder, 3-bit ripple-carry adder, and 4-bit ripple-carry adder.

## RTL
- `rtl/half_adder.v`
- `rtl/full_adder.v`
- `rtl/three_bit_ripple_adder.v`
- `rtl/four_bit_ripple_adder.v`

## Verification
The testbenches exhaustively cover all possible input combinations: 8 full-adder vectors, 128 3-bit vectors, and 512 4-bit vectors.
