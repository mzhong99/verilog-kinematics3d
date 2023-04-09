`timescale 1us/100ns

module TopModule
(
    input [2:0] addrA,
    input [2:0] addrB,
    input [2:0] opselect,
    output [7:0] result
);

    wire [7:0] qA;
    wire [7:0] qB;

    DualPortROM rom
    (
        .addrA(addrA),
        .addrB(addrB),
        .qA(qA),
        .qB(qB)
    );

    ArithCircuit arith
    (
        .opselect(opselect),
        .OpA(qA),
        .OpB(qB),
        .result(result)
    );

endmodule
