`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 14:57:26
// Design Name: 
// Module Name: cpu_with_memory
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


module cpu_with_memory(
    input wire clk, reset,
    output wire[31:0]  WriteData, DataAdr,
    output wire MemWrite
    );
    
wire[31:0] PC, Instr, ReadData;
    
processor cpu(clk, reset, PC, Instr, WriteData, DataAdr, ReadData, MemWrite);
data_memory data_mem(clk, MemWrite, DataAdr, WriteData, ReadData);
instruction_memory instr_mem(PC, Instr);

endmodule
