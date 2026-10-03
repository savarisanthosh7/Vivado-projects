`timescale 1ns / 1ps
module full_adder (
    input A, B, Cin,
    output Sum, Cout
);
    wire S1, C1, C2;
    half_adder HA1 (.A(A), .B(B), .Sum(S1), .Carry(C1));
    half_adder HA2 (.A(S1), .B(Cin), .Sum(Sum), .Carry(C2));
    assign Cout = C1 | C2;
endmodule
