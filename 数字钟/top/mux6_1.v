`timescale 1ns / 1ps

module mux6_1(
    input [3:0] ch0,
    input [3:0] ch1,
    input [3:0] ch2,
    input [3:0] ch3,
    input [3:0] ch4,
    input [3:0] ch5,
    input [3:0] bcdsel,
    output [3:0] bcd
    );
reg[3:0] bcdr;
assign bcd=bcdr;
always @(bcdsel)
case (bcdsel)
4'b0000:bcdr<=ch0;
4'b0001:bcdr<=ch1;
4'b0010:bcdr<=ch2;
4'b0011:bcdr<=ch3;
4'b0100:bcdr<=ch4;
4'b0101:bcdr<=ch5;
default:bcdr<=4'b1111;
endcase

endmodule
