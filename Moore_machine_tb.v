`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 04:05:11 PM
// Design Name: 
// Module Name: Moore_machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Moore_machine_tb;

    // Inputs
    reg clk;
    reg reset;
    reg inbits;

    // Outputs
    wire detect;

    // Instantiate the Unit Under Test (UUT)
    Moore_Machine uut (
        .clk(clk),
        .inbits(inbits),
        .reset(reset),
        .detect(detect)
    );

    // Clock generation (50 MHz, 20 ns period)
    always #10 clk = ~clk;  // Toggle clock every 10 ns (20 ns period)

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;  // Reset the system
        inbits = 0;

        // Wait for global reset to finish
        #20;   // Wait 20 ns
        reset = 0;  // Release reset

        // Test Case 1: Simple transitions
        #20 inbits = 1;   // Transition to state 2'b01
        #20 inbits = 0;   // Transition to state 2'b10
        #20 inbits = 1;   // Transition to state 2'b01
        #20 inbits = 1;   // Transition to state 2'b11 (Detect should be 1)
        #20 inbits = 0;   // Transition to state 2'b10 (Detect should be 0)

        // Test Case 2: Reset the system again
        #20 reset = 1;
        #20 reset = 0;

        // Test Case 3: Random pattern
        #20 inbits = 1;
        #20 inbits = 1;
        #20 inbits = 0;
        #20 inbits = 1;   // Detect should be high again

        // End simulation after some time
        #100 $finish;
    end
      
endmodule

