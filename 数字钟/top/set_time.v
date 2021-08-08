`timescale 1ns / 1ps

module set_time(
    input clk,
    input en,
    input min_hour,
    output [3:0] bcd_mu,
    output [3:0] bcd_mt,
    output [3:0] bcd_hu,
    output [3:0] bcd_ht,
    input cr
    );
wire en_min,en_hour,rco60;
assign en_min=en&min_hour;
assign en_hour=en&~min_hour;
c24 hour(clk,en_hour,cr,bcd_hu,bcd_ht);
c60 minute(clk,en_min,cr,rco60,bcd_mt,bcd_mu);

endmodule
