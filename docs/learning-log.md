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
A half adder cannot add a carry from a previous addition. It only has two inputs (a and b) and cannot accept a carry-in bit. This means it can only be used for the least significant bit in a multi-bit addition.

### Next Step
Build a full adder that adds three 1-bit inputs (a, b, and carry_in) to produce sum and carry_out. The full adder can be constructed using two half adders, demonstrating how simple components combine to create more powerful circuits.

---

## Full Adder

### Date
July 27, 2026

### Concept Learned
A full adder extends the half adder by accepting a carry-in from a previous bit position. It adds three 1-bit inputs (a, b, and carry_in) to produce a sum and carry_out. This is the essential building block for multi-bit arithmetic.

### What I Implemented
- Created `rtl/full_adder.v` using two instances of the existing half_adder module
- Connected the half adders with wires for hierarchical design
- Combined the two carry outputs using an OR gate
- Created comprehensive testbench `testbenches/full_adder_tb.v` that tests all 8 input combinations
- Updated README.md and this learning log

### Why Full Adder Over Half Adder?

**The Problem with Half Adders:**
When adding multi-bit numbers, we need to propagate carries from one bit position to the next. A half adder can only add two bits and cannot accept a carry from the previous position. For example:
```
  101  (5)
+ 011  (3)
-----
```
When adding the rightmost bits (1 + 1 = 10), we get a carry of 1. This carry must be added to the next position along with the original two bits (0 + 1 + carry_in = 1).

**The Solution: Full Adder:**
A full adder accepts three inputs:
- `a`: first bit to add
- `b`: second bit to add
- `carry_in`: carry from the previous position

It produces two outputs:
- `sum`: the result bit (without the carry)
- `carry_out`: the carry to the next position

### How a Full Adder Works Using Two Half Adders

The design is elegant and demonstrates **hierarchical thinking** in digital design:

**Step 1: First Half Adder (HA1)**
- Inputs: `a` and `b`
- Outputs: `ha1_sum` and `ha1_carry`
- This adds the two input bits just like a regular half adder

**Step 2: Second Half Adder (HA2)**
- Inputs: `ha1_sum` (result from HA1) and `carry_in` (from previous position)
- Outputs: `sum` (final result) and `ha2_carry`
- This adds the intermediate sum with the incoming carry

**Step 3: OR Gate**
- Inputs: `ha1_carry` and `ha2_carry`
- Output: `carry_out`
- Either carry could be present, so we OR them together
- If HA1 generates a carry OR HA2 generates a carry, we pass it to the next position

### Full Adder Truth Table

With three inputs (a, b, carry_in), there are 2³ = 8 combinations:

| a | b | carry_in | sum | carry_out | Explanation |
|---|---|----------|-----|-----------|-------------|
| 0 | 0 | 0 | 0 | 0 | 0+0+0 = 0 |
| 0 | 0 | 1 | 1 | 0 | 0+0+1 = 1 |
| 0 | 1 | 0 | 1 | 0 | 0+1+0 = 1 |
| 0 | 1 | 1 | 0 | 1 | 0+1+1 = 10 (binary) |
| 1 | 0 | 0 | 1 | 0 | 1+0+0 = 1 |
| 1 | 0 | 1 | 0 | 1 | 1+0+1 = 10 (binary) |
| 1 | 1 | 0 | 0 | 1 | 1+1+0 = 10 (binary) |
| 1 | 1 | 1 | 1 | 1 | 1+1+1 = 11 (binary) |

### Verifying the Two Half Adder Approach

Let's trace through one example: a=1, b=1, carry_in=1 (should give sum=1, carry_out=1):

**HA1: adds a=1 and b=1**
- ha1_sum = 1 XOR 1 = 0
- ha1_carry = 1 AND 1 = 1

**HA2: adds ha1_sum=0 and carry_in=1**
- sum = 0 XOR 1 = 1 ✓
- ha2_carry = 0 AND 1 = 0

**OR the carries:**
- carry_out = ha1_carry OR ha2_carry = 1 OR 0 = 1 ✓

Result: sum=1, carry_out=1 — Correct!

### Why the OR Gate Works for Combining Carries

The key insight is that **both carry outputs cannot be 1 at the same time**:
- ha1_carry = 1 only if a=1 AND b=1
- ha2_carry = 1 only if ha1_sum=1 AND carry_in=1
- But if a=1 AND b=1, then ha1_sum=0, so ha2_carry cannot be 1

This mutual exclusivity means OR works perfectly to combine them. If either generates a carry, we use it.

### Problem I Encountered
Initially, I wondered why we need an OR gate instead of just using one of the carries. The answer is that either the first half adder (when a and b are both 1) or the second half adder (when the intermediate sum and carry_in are both 1) could generate a carry, but never both simultaneously.

### How I Debugged It
I created a truth table and traced through each input combination manually, following the path through the two half adders and verifying that the OR gate correctly propagates whichever carry is generated.

### What I Can Now Explain

**Hierarchical Design:**
The full adder demonstrates an important principle: complex logic can be built from simpler, reusable components. We didn't rewrite the XOR and AND logic; we reused the half_adder module twice.

**Scalability:**
Multiple full adders can be chained together (ripple-carry architecture) to add multi-bit numbers. The carry_out of one bit becomes the carry_in of the next bit. For an 8-bit adder, we'd use one half adder for the least significant bit (since there's no carry_in) and seven full adders chained together.

**Testbench Coverage:**
The testbench covers all 8 cases systematically, ensuring that every combination of inputs produces the correct sum and carry. This gives us confidence that the module works correctly before using it in larger circuits.

### Next Step
Build an 8-bit ripple-carry adder by chaining full adders together. This will demonstrate how we can add 8-bit numbers by combining multiple 1-bit adders, with each adder's carry feeding into the next adder's carry_in.

---

*Last updated: 2026-07-27*
