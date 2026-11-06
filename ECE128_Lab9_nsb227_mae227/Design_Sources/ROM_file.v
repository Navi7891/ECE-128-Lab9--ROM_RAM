`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/5/2026
// Design Name: lab 9
// Module Name: ROM_file
// Project Name: lab 9
// Description: 8 locations, 4 bits each. Load values from a text file.
//////////////////////////////////////////////////////////////////////////////////

module ROM_file(ROM_data, ROM_addr);
    output [3:0] ROM_data;
    input [2:0] ROM_addr;

    reg [3:0] mem [0:7];

    initial begin
        $readmemh("rom_data.mem", mem);
    end

    assign ROM_data = mem[ROM_addr];
endmodule
