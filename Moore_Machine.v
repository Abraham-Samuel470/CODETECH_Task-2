`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 03:24:15 PM
// Design Name: Moore Machine
// Module Name: Moore_Machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Moore state machine to detect certain conditions
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Moore_Machine(
    input clk,
    input inbits,
    input reset,
    output reg detect
    );
    
    // State definition
    reg [1:0] state;

    // Initialize state
    initial begin
        state = 2'b00;
    end

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else begin
            case (state)
                2'b00: begin
                    if (inbits) state <= 2'b01;
                    else        state <= 2'b10;
                end
                2'b01: begin
                    if (inbits) state <= 2'b11;
                    else        state <= 2'b10;
                end
                2'b10: begin
                    if (inbits) state <= 2'b01;
                    else        state <= 2'b11;
                end
                2'b11: begin
                    if (inbits) state <= 2'b01;
                    else        state <= 2'b10;
                end
            endcase
        end
    end

    // Output logic based on state
    always @(posedge clk or posedge reset) begin
        if (reset)
            detect <= 1'b0;
        else if (state == 2'b11)
            detect <= 1'b1;  // Output detect when in state 2'b11
        else
            detect <= 1'b0;  // Default case
    end
endmodule
