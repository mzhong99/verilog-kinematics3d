////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename: dual_port_rom.v
// Author:   K Cooper 
// Smurf:    mzhong99
// Created:  3 Oct 2019
// Version:  1
// Description: rom for OpA and OpB
//
//
//  You must not modify any part of this file.
//
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1us/100ns

module DualPortROM
(
    input wire [2:0] addrA,
    input wire [2:0] addrB,
    output wire [7:0] qA,
    output wire [7:0] qB
);

    reg [7:0] rom [0:7];

    // Specify the ROM contents using the $readmemh command.
    // You must modify the contents of the rom.txt file to change the ROM contents.
    initial $readmemh("config/rom.txt", rom);

    assign qA = rom[addrA];
    assign qB = rom[addrB];

endmodule
