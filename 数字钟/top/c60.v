`timescale 1ns / 1ps

module c60(
    input clk,
    input en,
    input cr,
    output rco,
    output [3:0] bcd_t,
    output [3:0] bcd_u
    );
wire rco_u,rco_t;
assign rco=rco_u&rco_t;
c10 units(clk,en,cr,rco_u,bcd_u);
c6 tens(clk,cr,rco_t,rco_u&en,bcd_t);

endmodule
