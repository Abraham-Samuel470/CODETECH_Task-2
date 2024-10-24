`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 03:24:15 PM
// Design Name: Mealy Machine
// Module Name: Mealy_Machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Mealy state machine to detect a specific pattern
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Mealy_Machine(
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
        detect = 1'b0;
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

    // Mealy output logic
    always @(state or inbits) begin
        case (state)
            2'b00: detect = (inbits == 1'b1) ? 1'b1 : 1'b0;
            2'b01: detect = (inbits == 1'b0) ? 1'b1 : 1'b0;
            2'b10: detect = (inbits == 1'b1) ? 1'b1 : 1'b0;
            2'b11: detect = (inbits == 1'b0) ? 1'b1 : 1'b0;
            default: detect = 1'b0;
        endcase
    end
endmodule

