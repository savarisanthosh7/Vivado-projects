`timescale 1ns / 1ps
module full_adder_tb;
    reg A, B, Cin;
    wire Sum, Cout;
    integer i, errors;
    full_adder uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);
        errors=0;
        for(i=0;i<8;i=i+1) begin
            {A,B,Cin}=i[2:0]; #10;
            if({Cout,Sum} !== A+B+Cin) errors=errors+1;
        end
        if(errors==0) $display("PASS: full_adder - all 8 vectors correct");
        else $display("FAIL: full_adder - %0d errors",errors);
        $finish;
    end
endmodule
