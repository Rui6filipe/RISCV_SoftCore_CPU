`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 11:11:43
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(
    input wire op5,
    input wire[1:0] ALUOp,
    input wire[2:0] funct3,
    input wire funct7,
    output reg[2:0] ALUControl
    );
    
wire RtypeSub;
assign RtypeSub = op5 & funct7;
    
always @(*) begin
    case (ALUOp)   
    
        2'b00: ALUControl = 3'b000; // add, lw and sw instructions
        2'b01: ALUControl = 3'b001; // subtract, beq instructions
        default: case (funct3) // R-type or I-type ALU
                    3'b000: if (RtypeSub == 1) 
                                ALUControl = 3'b001; // sub
                            else
                                ALUControl = 3'b000; // add, addi   
                    3'b010: ALUControl = 3'b101; // slt, slti
                    3'b110: ALUControl = 3'b011; // or, ori
                    3'b111: ALUControl = 3'b010; // and, andi
                    default: ALUControl = 3'bxxx; 
                  endcase
    endcase
end
endmodule
