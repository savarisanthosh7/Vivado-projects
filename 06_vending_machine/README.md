# 06 — Vending Machine

Moore FSM for a single product priced at Rs. 10.

## Inputs
- `coin5` — Rs. 5
- `coin10` — Rs. 10
- `cancel` — refund after Rs. 5
- `item_available` — product availability

## Outputs
- `dispense`
- `change5`
- `refund5`

The testbench covers direct Rs. 10 purchase, Rs. 5 + Rs. 5, Rs. 5 + Rs. 10 with change, cancellation, and unavailable-product behavior.
