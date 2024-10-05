`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 22:42:36
// Design Name: 
// Module Name: Extend
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


module Extend(
    input wire[31:7] Instr,
    input wire[1:0] ImmSrc,
    output reg[31:0] ImmExt
    );
    
always @(*) begin
    case (ImmSrc) 
        2'b00: ImmExt = {{20{Instr[31]}}, Instr[31:20]}; // Type I
        2'b01: ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]}; // Type S
        2'b10: ImmExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0}; // Type B
        2'b11: ImmExt = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0}; // Type J
        default: ImmExt = 32'bx; // Undefined
    endcase
end
endmodule
