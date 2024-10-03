`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 20:51:43
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire[31:0] A, B,
    input wire[2:0] ALUOp,
    output reg[31:0] Result,
    output reg Zero
    );
    
always @(*) begin
    case(ALUOp)
        3'b000: Result = A + B;
        3'b001: Result = A - B;
        3'b010: Result = A & B;
        3'b011: Result = A ^ B;
        3'b101: Result = (A < B) ? 1'b1 : 1'b0; // When A < B, Result = 1. Otherwise, Result = 0
        default: Result = 32'h00000000;
    endcase
    
    Zero = (Result == 32'h00000000) ? 1'b1 : 1'b0;
    
end
endmodule
