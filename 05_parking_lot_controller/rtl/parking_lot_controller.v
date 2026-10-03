`timescale 1ns / 1ps
module parking_lot_controller #(parameter CAPACITY=4)(
    input wire clk,reset,entry_sensor,exit_sensor,
    output reg entry_gate,exit_gate,full,
    output reg [2:0] count
);
    localparam [1:0] IDLE=2'b00,ENTRY=2'b01,EXIT=2'b10,FULL=2'b11;
    reg [1:0] state,next_state;
    always @(posedge clk or posedge reset) begin
        if(reset) begin state<=IDLE; count<=3'd0; end
        else begin
            state<=next_state;
            if(state==ENTRY && count<CAPACITY) count<=count+1'b1;
            else if(state==EXIT && count>0) count<=count-1'b1;
        end
    end
    always @(*) begin
        case(state)
            IDLE: begin
                if(entry_sensor && count<CAPACITY) next_state=ENTRY;
                else if(exit_sensor && count>0) next_state=EXIT;
                else next_state=IDLE;
            end
            ENTRY: next_state=(count==CAPACITY-1)?FULL:IDLE;
            EXIT: next_state=IDLE;
            FULL: next_state=exit_sensor?EXIT:FULL;
            default: next_state=IDLE;
        endcase
    end
    always @(*) begin
        entry_gate=(state==ENTRY); exit_gate=(state==EXIT); full=(state==FULL);
    end
endmodule
