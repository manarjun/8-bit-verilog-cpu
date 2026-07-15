# 8-Bit Verilog CPU

This project will build a simple 8-bit CPU while learning Verilog, digital logic, computer architecture, and hardware verification.

## Repository Structure

```
rtl/                    # RTL (Register Transfer Level) designs
├── mux_2_to_1.v       # 2-to-1 multiplexer implementation

testbenches/            # Testbenches for verification
├── mux_2_to_1_tb.v    # Testbench for 2-to-1 multiplexer

docs/                   # Documentation
programs/               # Example programs and assembly
diagrams/               # Circuit diagrams and schematics
```

## Roadmap

- [x] 2-to-1 Multiplexer
- [ ] Full adder
- [ ] 8-bit ALU
- [ ] Registers
- [ ] Register file
- [ ] Program counter
- [ ] Control unit
- [ ] Instruction memory
- [ ] Data memory
- [ ] Complete CPU

## Completed Components

- **2-to-1 Multiplexer**: Fully implemented and tested with comprehensive testbench

## Running Simulations

To run the 2-to-1 multiplexer testbench using Icarus Verilog:

```bash
iverilog -o sim rtl/mux_2_to_1.v testbenches/mux_2_to_1_tb.v
vvp sim
```

For other simulators (ModelSim, QuestaS[...], Vivado, etc.), consult their documentation for compilation and simulation commands.

## Status

This project is under active development.
