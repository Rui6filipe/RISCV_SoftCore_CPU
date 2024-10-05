`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 11:42:52
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input wire Zero,
    input wire[6:0] op,
    output wire RegWrite,
    output wire[1:0] ImmSrc,
    output wire ALUSrc,
    output wire MemWrite,
    output wire[1:0] ResultSrc,
    output wire branch,
    output wire[1:0] ALUOp,
    output wire jump
    );
    
reg [10:0] controls;
assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, branch, ALUOp, Jump} = controls;
    
always @(*) begin
    case (op)
        7'b0000011: controls = 11'b1_00_1_0_01_0_00_0;
        7'b0100011: controls = 11'b0_01_1_1_xx_0_00_0;
        7'b0110011: controls = 11'b1_xx_0_0_00_0_10_0;
        7'b1100011: controls = 11'b0_10_0_0_xx_1_01_0;
        7'b0010011: controls = 11'b1_00_1_0_00_0_10_0;
        7'b1101111: controls = 11'b1_11_x_0_10_0_xx_1;  
        default: controls = 11'bx_xx_x_x_xx_x_xx_x;
    endcase
end   
endmodule



