`timescale 1ns / 1ps

// Full Adder Testbench
// Tests all 8 possible combinations of a, b, and carry_in
// Verifies sum and carry_out for each input combination

module full_adder_tb();

  // Declare test signals
  reg a, b, carry_in;           // Input signals (reg can be driven by testbench)
  wire sum, carry_out;          // Output signals (wire reads from module)
  
  // Instantiate the full adder module under test
  full_adder dut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
  );
  
  initial begin
    $display("Full Adder Test Bench");
    $display("=====================");
    $display("Testing all 8 input combinations:");
    $display("");
    
    // Test case 1: a=0, b=0, carry_in=0
    // Expected: sum=0, carry_out=0
    a = 1'b0;
    b = 1'b0;
    carry_in = 1'b0;
    #10;
    $display("Test 1: a=%b, b=%b, carry_in=%b -> sum=%b (expected 0), carry_out=%b (expected 0)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b0 && carry_out === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 2: a=0, b=0, carry_in=1
    // Expected: sum=1, carry_out=0
    a = 1'b0;
    b = 1'b0;
    carry_in = 1'b1;
    #10;
    $display("Test 2: a=%b, b=%b, carry_in=%b -> sum=%b (expected 1), carry_out=%b (expected 0)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b1 && carry_out === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 3: a=0, b=1, carry_in=0
    // Expected: sum=1, carry_out=0
    a = 1'b0;
    b = 1'b1;
    carry_in = 1'b0;
    #10;
    $display("Test 3: a=%b, b=%b, carry_in=%b -> sum=%b (expected 1), carry_out=%b (expected 0)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b1 && carry_out === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 4: a=0, b=1, carry_in=1
    // Expected: sum=0, carry_out=1 (0+1+1=10 in binary)
    a = 1'b0;
    b = 1'b1;
    carry_in = 1'b1;
    #10;
    $display("Test 4: a=%b, b=%b, carry_in=%b -> sum=%b (expected 0), carry_out=%b (expected 1)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b0 && carry_out === 1'b1)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 5: a=1, b=0, carry_in=0
    // Expected: sum=1, carry_out=0
    a = 1'b1;
    b = 1'b0;
    carry_in = 1'b0;
    #10;
    $display("Test 5: a=%b, b=%b, carry_in=%b -> sum=%b (expected 1), carry_out=%b (expected 0)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b1 && carry_out === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 6: a=1, b=0, carry_in=1
    // Expected: sum=0, carry_out=1 (1+0+1=10 in binary)
    a = 1'b1;
    b = 1'b0;
    carry_in = 1'b1;
    #10;
    $display("Test 6: a=%b, b=%b, carry_in=%b -> sum=%b (expected 0), carry_out=%b (expected 1)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b0 && carry_out === 1'b1)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 7: a=1, b=1, carry_in=0
    // Expected: sum=0, carry_out=1 (1+1=10 in binary)
    a = 1'b1;
    b = 1'b1;
    carry_in = 1'b0;
    #10;
    $display("Test 7: a=%b, b=%b, carry_in=%b -> sum=%b (expected 0), carry_out=%b (expected 1)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b0 && carry_out === 1'b1)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 8: a=1, b=1, carry_in=1
    // Expected: sum=1, carry_out=1 (1+1+1=11 in binary)
    a = 1'b1;
    b = 1'b1;
    carry_in = 1'b1;
    #10;
    $display("Test 8: a=%b, b=%b, carry_in=%b -> sum=%b (expected 1), carry_out=%b (expected 1)", 
             a, b, carry_in, sum, carry_out);
    if (sum === 1'b1 && carry_out === 1'b1)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    $display("=====================");
    $display("Full Adder tests complete!");
    $finish;
  end

endmodule
