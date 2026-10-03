# 04 — Moore 1011 Sequence Detector

A Moore FSM that detects the serial pattern `1011`. States represent useful prefixes of the pattern and preserve suffix information so overlapping patterns can be detected.

## States
- S0 — no useful match
- S1 — `1`
- S2 — `10`
- S3 — `101`
- S4 — `1011` (output high)

## Verification
A reference-model testbench checks the DUT cycle-by-cycle and applies additional random input data.
