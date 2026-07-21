`timescale 1ns / 1ps

module half_adder_tb();
  reg a, b;
  wire sum, carry;
  
  // Instantiate the half adder
  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );
  
  initial begin
    $display("Half Adder Test Bench");
    $display("=====================");
    $display("Testing all 4 input combinations:");
    $display("");
    
    // Test case 1: 0 + 0 = 0, carry 0
    a = 1'b0;
    b = 1'b0;
    #10;
    $display("Test 1: a=%b, b=%b -> sum=%b (expected 0), carry=%b (expected 0)", a, b, sum, carry);
    if (sum === 1'b0 && carry === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 2: 0 + 1 = 1, carry 0
    a = 1'b0;
    b = 1'b1;
    #10;
    $display("Test 2: a=%b, b=%b -> sum=%b (expected 1), carry=%b (expected 0)", a, b, sum, carry);
    if (sum === 1'b1 && carry === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 3: 1 + 0 = 1, carry 0
    a = 1'b1;
    b = 1'b0;
    #10;
    $display("Test 3: a=%b, b=%b -> sum=%b (expected 1), carry=%b (expected 0)", a, b, sum, carry);
    if (sum === 1'b1 && carry === 1'b0)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    // Test case 4: 1 + 1 = 0, carry 1
    a = 1'b1;
    b = 1'b1;
    #10;
    $display("Test 4: a=%b, b=%b -> sum=%b (expected 0), carry=%b (expected 1)", a, b, sum, carry);
    if (sum === 1'b0 && carry === 1'b1)
      $display("        PASS");
    else
      $display("        FAIL");
    $display("");
    
    $display("=====================");
    $display("Half Adder tests complete!");
    $finish;
  end

endmodule
