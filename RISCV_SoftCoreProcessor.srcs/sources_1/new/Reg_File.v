`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 20:28:18
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
    input wire clk, write_enable,
    input wire [4:0] read_reg1, read_reg2, write_reg,
    input wire [31:0] write_data,
    output wire [31:0] read_data1, read_data2
    );
    
reg[31:0] registers [31:0]; // 32 32-bit registers

always@(posedge clk) begin
    if (write_enable)
        registers[write_reg] <= write_data; // Write data to the specified register
end

assign read_data1 = registers[read_reg1]; // Read data from register
assign read_data2 = registers[read_reg2];
endmodule

// Continuous assignments - read operations, to provide immediate access to register values.
// Clocked assignments - write operations, to ensure that data is written at specific times defined by the clock signal. 


