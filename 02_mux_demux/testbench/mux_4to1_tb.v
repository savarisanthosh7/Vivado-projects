`timescale 1ns / 1ps
module mux_4to1_tb;
    reg I0,I1,I2,I3,S1,S0; wire Y; reg expected; integer i,errors;
    mux_4to1 uut(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S1(S1),.S0(S0),.Y(Y));
    initial begin
        $dumpfile("mux_4to1_tb.vcd"); $dumpvars(0,mux_4to1_tb); errors=0;
        for(i=0;i<64;i=i+1) begin
            {I3,I2,I1,I0,S1,S0}=i[5:0]; #10;
            case({S1,S0}) 2'b00:expected=I0; 2'b01:expected=I1; 2'b10:expected=I2; 2'b11:expected=I3; endcase
            if(Y!==expected) errors=errors+1;
        end
        if(errors==0) $display("PASS: mux_4to1 - all 64 vectors correct");
        else $display("FAIL: mux_4to1 - %0d errors",errors);
        $finish;
    end
endmodule
