`timescale 1ns / 1ps
module t_flipflop_tb;
    reg T,CLK; wire Q,Qbar; reg Q_ref; integer errors;
    t_flipflop uut(.T(T),.CLK(CLK),.Q(Q),.Qbar(Qbar));
    always #5 CLK=~CLK;
    initial Q_ref=1'b0;
    always @(posedge CLK) if(T) Q_ref<=~Q_ref;
    always @(negedge CLK) begin
        if(Q!==Q_ref || Qbar!==~Q_ref) errors=errors+1;
    end
    initial begin
        $dumpfile("t_flipflop_tb.vcd"); $dumpvars(0,t_flipflop_tb);
        CLK=0;T=0;errors=0; #10 T=1; #40 T=0; #20 T=1; #40;
        if(errors==0) $display("PASS: t_flipflop - matches reference model");
        else $display("FAIL: t_flipflop - %0d errors",errors);
        $finish;
    end
endmodule
