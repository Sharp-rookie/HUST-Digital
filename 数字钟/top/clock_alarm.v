`timescale 1ns / 1ps

module clock_alarm(
    input clk_1hz,
    input clk_1k,
    input clk_5h,
    input en,
    input cr,
    input min_hour,
    input [3:0] bcd_tmu,
    input [3:0] bcd_tmt,
    input [3:0] bcd_thu,
    input [3:0] bcd_tht,
    output [3:0] bcd_smu,
    output [3:0] bcd_smt,
    output [3:0] bcd_shu,
    output [3:0] bcd_sht,
    output alarm
    );
wire equ;
assign equ=(bcd_tmu==bcd_smu)&(bcd_tmt==bcd_smt)&(bcd_thu==bcd_shu)&(bcd_tht==bcd_sht);
assign alarm=(equ&clk_1k&clk_1hz)|(equ&clk_5h&~clk_1hz);
set_time u_set_time(clk_1hz,en,min_hour,bcd_smu,bcd_smt,bcd_shu,bcd_sht,cr);

endmodule
