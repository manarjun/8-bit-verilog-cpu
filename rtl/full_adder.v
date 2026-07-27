// 1-bit Full Adder
// Adds three 1-bit inputs (a, b, carry_in) and produces sum and carry_out
// Built using two half_adder modules and one OR gate
// This demonstrates hierarchical design: combining simpler components

module full_adder(
  input a,
  input b,
  input carry_in,
  output sum,
  output carry_out
);

  // Internal wires connecting the half adders
  // ha1_sum: output sum from the first half adder (a + b)
  wire ha1_sum;
  
  // ha1_carry: output carry from the first half adder (a + b)
  wire ha1_carry;
  
  // ha2_carry: output carry from the second half adder (ha1_sum + carry_in)
  wire ha2_carry;

  // First half adder: adds a and b
  // Inputs: a, b
  // Outputs: ha1_sum (intermediate sum), ha1_carry (first carry)
  half_adder ha1 (
    .a(a),
    .b(b),
    .sum(ha1_sum),
    .carry(ha1_carry)
  );

  // Second half adder: adds the sum from ha1 with carry_in
  // Inputs: ha1_sum (from first adder), carry_in (from previous bit)
  // Outputs: sum (final sum), ha2_carry (second carry)
  half_adder ha2 (
    .a(ha1_sum),
    .b(carry_in),
    .sum(sum),
    .carry(ha2_carry)
  );

  // OR gate: combines the two carry signals
  // carry_out = 1 if either ha1_carry OR ha2_carry is 1
  // This ensures we don't lose any carry information
  assign carry_out = ha1_carry | ha2_carry;

endmodule
