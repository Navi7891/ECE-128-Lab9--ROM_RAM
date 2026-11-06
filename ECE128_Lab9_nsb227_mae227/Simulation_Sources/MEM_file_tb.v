`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/5/2026
// Design Name: lab 9
// Module Name: MEM_file_tb
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
// Testbench for the 8-bit RAM, with text file saving
module MEM_file_tb;
    reg i_clk, i_rst, i_write_en;
    reg [2:0] i_addr;
    reg [7:0] i_write_data;
    wire [7:0] o_read_data;

    MEM dut(.i_clk(i_clk), .i_rst(i_rst), .i_write_en(i_write_en),
            .i_addr(i_addr), .i_write_data(i_write_data),
            .o_read_data(o_read_data));

    initial begin
        i_clk = 0;
        forever #10 i_clk = ~i_clk;
    end

    initial begin
        i_rst = 1;
        i_write_en = 0;
        i_addr = 3'd0;
        i_write_data = 8'b00000000;

        // Write a value to each address
        #20; i_rst = 0;
        i_write_en = 1;
        i_addr = 3'd0; i_write_data = 8'b00001111;
        #20; i_addr = 3'd1; i_write_data = 8'b10101010;
        #20; i_addr = 3'd2; i_write_data = 8'b01010101;
        #20; i_addr = 3'd3; i_write_data = 8'b11110000;
        #20; i_addr = 3'd4; i_write_data = 8'b00000001;
        #20; i_addr = 3'd5; i_write_data = 8'b00110011;
        #20; i_addr = 3'd6; i_write_data = 8'b11001100;
        #20; i_addr = 3'd7; i_write_data = 8'b11111111;

        // Read the values back
        #20; i_write_en = 0; i_addr = 3'd0; // 00001111
        $writememh("ram_data.txt", dut.mem); // save RAM data to a text file
        $display("RAM data saved to ram_data.txt");
        #20; i_addr = 3'd1; // 10101010
        #20; i_addr = 3'd2; // 01010101
        #20; i_addr = 3'd3; // 11110000
        #20; i_addr = 3'd4; // 00000001
        #20; i_addr = 3'd5; // 00110011
        #20; i_addr = 3'd6; // 11001100
        #20; i_addr = 3'd7; // 11111111

        // Reset and read two addresses again
        #20; i_rst = 1;
        #20; i_rst = 0; i_addr = 3'd7; // 00000000
        #20; i_addr = 3'd0; // 00000000

        #20; $finish;
    end
endmodule
