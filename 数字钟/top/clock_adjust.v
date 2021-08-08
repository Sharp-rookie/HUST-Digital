`timescale 1ns / 1ps

module clock_adjust(
    input clk,
    input adjust,
    input cr,
    input min_hour,
    output [3:0] bcd_su,
    output [3:0] bcd_st,
    output [3:0] bcd_mu,
    output [3:0] bcd_mt,
    output [3:0] bcd_hu,
    output [3:0] bcd_ht
    );
wire m_en,h_en,rco_s,rco_m;
assign m_en=rco_s|(adjust&min_hour);
assign h_en=(rco_s&rco_m)|(adjust&~min_hour);
c60 second(clk,1,cr,rco_s,bcd_st,bcd_su);
c60 minute(clk,m_en,cr,rco_m,bcd_mt,bcd_mu);
c24 hour(clk,h_en,cr,bcd_hu,bcd_ht);

endmodule
