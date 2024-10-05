`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 14:44:32
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input wire[31:0] PC,
    output wire[31:0] Instr
    );
    
reg[31:0] RAM[63:0];
    
initial begin
    $readmemh("P:/RISCV_SoftCoreProcessor.sim/sim_1/behav/xsim/riscvtest.txt", RAM);
end

assign Instr = RAM[PC[31:2]]; //word aligned

endmodule
