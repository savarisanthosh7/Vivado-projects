`timescale 1ns / 1ps
module tb_parking_lot_controller;
    reg clk,reset,entry_sensor,exit_sensor;
    wire entry_gate,exit_gate,full; wire [2:0] count; integer errors;
    parking_lot_controller #(.CAPACITY(4)) uut(.clk(clk),.reset(reset),.entry_sensor(entry_sensor),.exit_sensor(exit_sensor),.entry_gate(entry_gate),.exit_gate(exit_gate),.full(full),.count(count));
    always #5 clk=~clk;
    task pulse_entry; begin @(negedge clk) entry_sensor=1; @(negedge clk) entry_sensor=0; repeat(2) @(negedge clk); end endtask
    task pulse_exit; begin @(negedge clk) exit_sensor=1; @(negedge clk) exit_sensor=0; repeat(2) @(negedge clk); end endtask
    task check(input [2:0] exp_count,input exp_full,input [127:0] label);
        begin if(count!==exp_count || full!==exp_full) begin $display("FAIL [%0s]: count=%0d full=%b (expected %0d / %b)",label,count,full,exp_count,exp_full); errors=errors+1; end end
    endtask
    initial begin
        $dumpfile("tb_parking_lot_controller.vcd"); $dumpvars(0,tb_parking_lot_controller);
        clk=0;reset=1;entry_sensor=0;exit_sensor=0;errors=0;#12 reset=0;@(negedge clk);check(0,0,"reset");
        pulse_entry;check(1,0,"car 1"); pulse_entry;check(2,0,"car 2"); pulse_entry;check(3,0,"car 3"); pulse_entry;check(4,1,"car 4 -> full");
        pulse_entry;check(4,1,"5th car refused"); pulse_exit;check(3,0,"one leaves"); pulse_entry;check(4,1,"refilled");
        pulse_exit;pulse_exit;pulse_exit;pulse_exit;check(0,0,"all leave"); pulse_exit;check(0,0,"exit on empty ignored");
        if(errors==0) $display("PASS: parking_lot_controller - all checks passed"); else $display("FAIL: parking_lot_controller - %0d errors",errors);
        $finish;
    end
endmodule
