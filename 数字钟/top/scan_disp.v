`timescale 1ns / 1ps

module scan_disp(
    input clk,
    input cr,
    input en,
    input [3:0] ch0,
    input [3:0] ch1,
    input [3:0] ch2,
    input [3:0] ch3,
    input [3:0] ch4,
    input [3:0] ch5,
    output [6:0] seg,
    output [7:0] pos
    );
wire rco;
wire [3:0] bcdse1,bcd_data;
c6 u_count(clk,cr,rco,en,bcdse1);
mux6_1 u_mux(ch0,ch1,ch2,ch3,ch4,ch5,bcdse1,bcd_data);
posdecode u_pos(bcdse1,pos);
bcd_7seg u_seg(bcd_data,seg);

endmodule
