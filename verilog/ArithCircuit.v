////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename: ArithCircuit.v
// Author:   KLC
// Smurf:    mzhong99
//
// Created:  3 Oct 2019
//
// Changelog:
//--------------------------------------------------------------------------------------------------
// Version:  2 (modified 12 Sep 2022, KLC)
// Version:  3 (modified  8 Apr 2023, mzhong99)
//
// Description: The arithmetic circuit should take the operands OpA, OpB from the  
// ROM in the top level entity, and the inputs SW[2:0] from the DE10-Lite board 
// to select the operation.  The output result drives LEDs [7:0] on the DE10-Lite 
// board.
//
//  **************************************************
//  This file is the only Verilog file that you should modify.
//  It should be properly commented and formatted.
//  **************************************************
//
////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1us/100ns

// Do not change the port declarations
module ArithCircuit
(
    input wire [2:0] opselect,
    input wire [7:0] OpA,
    input wire [7:0] OpB,
    output reg [7:0] result
);

    always @(*) begin
        case (opselect)
            3'h0:       result = OpA;
            3'h1:       result = OpA + OpB;
            3'h2:       result = OpA - OpB;
            3'h3:       result = OpB - OpA;
            3'h4:       result = -OpA;
            3'h5:       result = OpA + 8'd1;
            3'h6:       result = OpA - 8'd3;
            3'h7:       result = OpB + 8'd2;
            default:    result = 8'd0;
        endcase
    end

endmodule
