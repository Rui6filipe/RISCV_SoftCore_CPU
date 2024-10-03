`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 23:09:30
// Design Name: 
// Module Name: datapath
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


module datapath(
    input wire clk,
    output wire[31:0] PC,
    input wire PCSrc, RegWrite,
    input wire [31:0] Instr,
    output wire[31:0] WriteData,
    input wire[1:0] ImmSrc, ResultSrc,
    output wire[31:0] ALUResult,
    output wire Zero,
    input wire ALUSrc,
    input wire[31:0] ReadData,
    input wire[2:0] ALUControl 
    );
    
wire [31:0]PCNext, PCPlus4, PCTarget;
wire [31:0]ImmExt;
wire [31:0]Result;
wire [31:0]SrcA, SrcB;

// Next PC logic
program_counter pc_reg(clk, PCNext, PC);
Adder pcadd4(PC, 32'd4, PCPlus4);
Adder pcaddbranch(PC, ImmExt, PCTarget);
mux_2 pcmux(PCPlus4, PCTarget, PCSrc, PCNext);

// Register File Logic
Reg_File rf(clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, SrcA, WriteData);
extend ext(Instr[31:7], ImmSrc, ImmExt);

// ALU Logic
mux_2 srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
ALU alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
mux_3 result_mux(ALUResult, ReadData, PCPlus4, ResultSrc, Result);
    
endmodule