`timescale 1ns/1ps

// Testbench for 1-bit 2-to-1 multiplexer
// Tests all 8 combinations of inputs: a, b, sel
// Expected behavior: sel=0 → out=a; sel=1 → out=b

module mux_2_to_1_tb;

    // Signal declarations
    reg a;
    reg b;
    reg sel;
    wire out;
    
    integer pass_count;
    integer fail_count;

    // Instantiate the DUT (device under test)
    mux_2_to_1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );
    
    // Task to check output
    task check_output(input exp_val, input test_num);
        if (out === exp_val) begin
            $display("Test %d PASS: a=%b b=%b sel=%b → out=%b (expected %b)", 
                     test_num, a, b, sel, out, exp_val);
            pass_count = pass_count + 1;
        end else begin
            $display("Test %d FAIL: a=%b b=%b sel=%b → out=%b (expected %b)", 
                     test_num, a, b, sel, out, exp_val);
            fail_count = fail_count + 1;
        end
    endtask

    initial begin
        pass_count = 0;
        fail_count = 0;
        
        // Test case 1: a=0, b=0, sel=0 → out should be 0
        a = 0; b = 0; sel = 0;
        #10;
        check_output(1'b0, 1);
        
        // Test case 2: a=0, b=0, sel=1 → out should be 0
        a = 0; b = 0; sel = 1;
        #10;
        check_output(1'b0, 2);
        
        // Test case 3: a=0, b=1, sel=0 → out should be 0
        a = 0; b = 1; sel = 0;
        #10;
        check_output(1'b0, 3);
        
        // Test case 4: a=0, b=1, sel=1 → out should be 1
        a = 0; b = 1; sel = 1;
        #10;
        check_output(1'b1, 4);
        
        // Test case 5: a=1, b=0, sel=0 → out should be 1
        a = 1; b = 0; sel = 0;
        #10;
        check_output(1'b1, 5);
        
        // Test case 6: a=1, b=0, sel=1 → out should be 0
        a = 1; b = 0; sel = 1;
        #10;
        check_output(1'b0, 6);
        
        // Test case 7: a=1, b=1, sel=0 → out should be 1
        a = 1; b = 1; sel = 0;
        #10;
        check_output(1'b1, 7);
        
        // Test case 8: a=1, b=1, sel=1 → out should be 1
        a = 1; b = 1; sel = 1;
        #10;
        check_output(1'b1, 8);
        
        // Summary
        $display("\n========================================");
        $display("Test Summary: %d PASSED, %d FAILED", pass_count, fail_count);
        $display("========================================\n");
        
        $finish;
    end

endmodule
