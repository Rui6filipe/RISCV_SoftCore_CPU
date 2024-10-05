`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 14:11:44
// Design Name: 
// Module Name: processor
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


module processor(
    input wire clk, reset,
    output wire[31:0] PC,
    input wire [31:0] Instr, 
    output wire[31:0] WriteData,
    output wire[31:0] ALUResult,
    input wire[31:0] ReadData,
    output wire MemWrite
    );

wire PCSrc, RegWrite;
wire[1:0] ImmSrc, ResultSrc;
wire Zero;
wire ALUSrc;
wire[2:0] ALUControl ;
 
controler cntrl(Instr[6:0], Instr[14:12], Instr[30], Zero, ALUControl, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc );       
datapath datap(clk, reset, PC, PCSrc, RegWrite, Instr, WriteData, ImmSrc, ResultSrc, ALUResult, Zero, ALUSrc, ReadData, ALUControl);

endmodule
