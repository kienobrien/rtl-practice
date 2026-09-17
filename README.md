# RTL Practice

Personal SystemVerilog/RTL practice repository focused on building practical digital-design skills for FPGA/ASIC internships.

## Current modules
- **Parameterized counter** — sequential logic, reset, enable, parameterization
- **Priority encoder** — combinational logic and priority behavior

## Tools
- SystemVerilog
- Vivado for synthesis and waveform inspection
- Optional: Icarus Verilog for quick command-line simulation

## Repository structure
- `src/` — synthesizable RTL
- `tb/` — self-checking testbenches

## Quick simulation with Icarus Verilog

Counter:
```bash
mkdir -p build
iverilog -g2012 -o build/counter_tb src/counter.sv tb/tb_counter.sv
vvp build/counter_tb
```

Priority encoder:
```bash
mkdir -p build
iverilog -g2012 -o build/priority_tb src/priority_encoder.sv tb/tb_priority_encoder.sv
vvp build/priority_tb
```

## Learning goals
I should be able to explain:
- `always_ff` vs. `always_comb`
- blocking vs. nonblocking assignments
- synchronous sequential logic
- reset and enable behavior
- parameterized RTL
- how synthesis maps RTL into hardware
- how a self-checking testbench verifies expected behavior

## Next additions
- finite-state machine
- ALU
- ready/valid handshake
- FIFO
- simple pipelined datapath

This repository is personal practice work and will grow as I build more RTL and verification experience.
