`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 14:31:56
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire clk, MemWrite,
    input wire[31:0] DataAdr, WriteData,
    output wire[31:0] ReadData
    );
 
reg[31:0] RAM[63:0];

assign ReadData = RAM[DataAdr[31:2]]; // word aligned, 256 bytes
// The lowest two bits (DataAdr[1:0]) of the address are always 00, so they are irrelevant when accessing the memory.

always @(posedge clk) begin
    if (MemWrite) RAM[DataAdr[31:2]] <= WriteData;
end
endmodule
