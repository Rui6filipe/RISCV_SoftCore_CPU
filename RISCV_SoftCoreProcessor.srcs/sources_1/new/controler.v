`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 14:01:15
// Design Name: 
// Module Name: controler
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


module controler(
    input wire[6:0] op,
    input wire[2:0] funct3,
    input wire funct7, 
    input wire Zero,
    output wire[2:0] ALUControl,
    output wire RegWrite,
    output wire[1:0] ImmSrc,
    output wire ALUSrc,
    output wire MemWrite,
    output wire[1:0] ResultSrc
    );
    
    
wire ALUOp[1:0];
wire branch, jump;
    
main_decoder maindec(Zero, op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, branch, ALUOp, jump);
ALU_Decoder aludec(op[4:0], ALUOp, funct3, funct7, ALUControl);

assign PCSrc = jump | (branch & Zero);
    
endmodule







