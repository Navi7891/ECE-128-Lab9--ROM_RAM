`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/5/2026
// Design Name: lab 9
// Module Name: ROM_file_tb
// Project Name: lab 9
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
// Testbench for the 4-bit ROM loaded from a text file
module ROM_file_tb;
    reg [2:0] ROM_addr;
    wire [3:0] ROM_data;

    ROM_file dut(.ROM_data(ROM_data), .ROM_addr(ROM_addr));

    initial begin
        ROM_addr = 3'd0; // 0000
        #20; ROM_addr = 3'd1; // 1100
        #20; ROM_addr = 3'd2; // 0110
        #20; ROM_addr = 3'd3; // 0111
        #20; ROM_addr = 3'd4; // 1000
        #20; ROM_addr = 3'd5; // 0001
        #20; ROM_addr = 3'd6; // 1101
        #20; ROM_addr = 3'd7; // 1110
        #20; $finish;
    end
endmodule
