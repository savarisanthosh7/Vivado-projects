# 05 — Parking Lot Controller

FSM-based parking controller with configurable capacity.

## Behavior
- Accept entry while space is available.
- Accept exit while at least one vehicle is present.
- Assert `full` at capacity.
- Refuse additional entries while full.
- Pulse `entry_gate` and `exit_gate` through the corresponding FSM states.

Default `CAPACITY` is 4 and can be changed through the Verilog parameter.

## Verification
The testbench fills the lot, checks a refused fifth vehicle, removes and adds vehicles again, and checks an exit when empty.
