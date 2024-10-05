`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2024 15:05:00
// Design Name: 
// Module Name: testbench
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


module testbench();

reg clk, reset;
reg[31:0]  WriteData, DataAdr;
reg MemWrite;

cpu_with_memory dut(.clk(clk), .reset(reset), .WriteData(WriteData), .DataAdr(DataAdr), .MemWrite(MemWrite));

initial begin
    reset = 1;
    #50;
    reset = 0;
end

always begin
    clk = 1;
    #5;
    clk = 0;
    #5;
end


always @(negedge clk) begin
    if (MemWrite) begin
        if (DataAdr === 100 && WriteData === 25) begin
            $display("Simulation sucedded");
            $stop;
        end else if (DataAdr !== 96) begin
            $display("Simulation failed");
            $stop;
        end
    end
end
endmodule
