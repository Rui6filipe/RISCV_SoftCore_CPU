`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 23:24:35
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input wire clk, reset,
    input wire [31:0] pc_in,
    output reg [31:0] pc_out
    );

always@(posedge clk) begin
    if (reset) pc_out <= 0;
    else pc_out <= pc_in;  // Update program counter with non blocking assignement (sequential logic)
end
endmodule
