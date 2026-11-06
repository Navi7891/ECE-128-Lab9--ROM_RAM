`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/5/2026
// Design Name: lab 9
// Module Name: MEM
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
// 8-bit RAM with 8 memory locations
module MEM(i_clk, i_rst, i_write_en, i_addr, i_write_data, o_read_data);
    input i_clk, i_rst, i_write_en;
    input [2:0] i_addr;
    input [7:0] i_write_data;
    output reg [7:0] o_read_data;

    reg [7:0] mem [0:7]; // 8 words, each has 8 bits

    always @(posedge i_clk) begin
        if(i_rst) begin
            mem[0] <= 8'b00000000;
            mem[1] <= 8'b00000000;
            mem[2] <= 8'b00000000;
            mem[3] <= 8'b00000000;
            mem[4] <= 8'b00000000;
            mem[5] <= 8'b00000000;
            mem[6] <= 8'b00000000;
            mem[7] <= 8'b00000000;
        end
        else begin
            if(i_write_en) // write data to the selected address
                mem[i_addr] <= i_write_data;
            else // read data from the selected address
                o_read_data <= mem[i_addr];
        end
    end
endmodule
