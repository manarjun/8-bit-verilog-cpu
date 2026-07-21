# Learning Log

## Half Adder

### Date
July 21, 2026

### Concept Learned
A half adder is the fundamental building block of digital arithmetic. It takes two 1-bit binary inputs and produces a sum bit and a carry bit.

### What I Implemented
- Created `rtl/half_adder.v` with XOR gate for sum calculation and AND gate for carry calculation
- Created comprehensive testbench `testbenches/half_adder_tb.v` that tests all 4 input combinations
- Learned why XOR creates the sum output and AND creates the carry output

### Problem I Encountered
Understanding why 1 + 1 results in sum = 0 and carry = 1 (not sum = 2). In binary, the result is "10" which is split across two bit positions: the rightmost position (sum) gets 0, and the next position (carry) gets 1.

### How I Debugged It
Drew a truth table showing all 4 combinations and compared with XOR/AND truth tables to verify the logic gates produce the correct binary arithmetic.

### What I Can Now Explain

**What a Half Adder Does:**
A half adder is a combinational logic circuit that adds two 1-bit binary inputs and produces two outputs: a sum bit and a carry bit. It performs basic binary addition on the smallest possible unit.

**Why XOR Creates the Sum:**
The XOR (exclusive OR) gate outputs 1 when its inputs are different and 0 when they are the same:
- 0 XOR 0 = 0 (sum bit when adding 0+0)
- 0 XOR 1 = 1 (sum bit when adding 0+1)
- 1 XOR 0 = 1 (sum bit when adding 1+0)
- 1 XOR 1 = 0 (sum bit when adding 1+1)

This perfectly matches binary addition in the least significant bit position.

**Why AND Creates the Carry:**
The AND gate outputs 1 only when BOTH inputs are 1, and 0 otherwise:
- 0 AND 0 = 0 (no carry when adding 0+0)
- 0 AND 1 = 0 (no carry when adding 0+1)
- 1 AND 0 = 0 (no carry when adding 1+0)
- 1 AND 1 = 1 (carry when adding 1+1)

This correctly produces a carry only when both bits are 1.

**Why 1 + 1 Gives Sum 0 and Carry 1:**
In binary arithmetic, 1 + 1 = 10 (which is 2 in decimal). This is a 2-bit result:
- The rightmost bit (sum) = 0
- The left bit (carry) = 1

The carry represents the "overflow" into the next higher bit position.

**The Limitation: No Carry-In:**
A half adder cannot add a carry from a previous addition. It only has two inputs (a and b) and cannot accept a carry-in bit. This means it can only be used for the least significant bit in a multi-bit addition. For all other bit positions, you need a **full adder** which has three inputs (a, b, and carry_in) to properly handle the carry from the previous stage.

### Next Step
Build a full adder that adds three 1-bit inputs (a, b, and carry_in) to produce sum and carry_out. The full adder can be constructed using two half adders, demonstrating how simple components combine to create more complex circuits.
