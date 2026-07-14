`timescale 1ns/1ps

// Testbench template for 1-bit 2-to-1 multiplexer
// This file provides a beginner-friendly scaffold. Fill in the TODOs to
// exercise the mux and add self-checking logic.

module mux_2_to_1_tb;

    // Signal declarations
    reg a;
    reg b;
    reg sel;
    wire out;

    // Instantiate the DUT (device under test)
    // Replace the module name/ports if you change them in the RTL.
    mux_2_to_1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize signals
        a = 0;
        b = 0;
        sel = 0;

        // TODO: Test case 1
        // e.g. set a=0 b=1 sel=0 and check out==?

        // TODO: Test case 2
        // Test other combinations (a,b,sel) to cover all important cases

        // TODO: Add self-checking PASS/FAIL logic using $display or $fatal
        // Example: if (out !== expected) $display("FAIL: ...");

        // Finish simulation
        #10;
        $display("Testbench finished — fill in tests to see PASS/FAIL");
        $finish;
    end

endmodule
