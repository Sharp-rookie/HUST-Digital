`timescale 1ns / 1ps

module c10(
    input clk,
    input en,
    input cr,
    output rco,
    output [3:0] bcd10
    );
reg [3:0] bcd10r;
assign rco=(bcd10r==9)?1'b1:1'b0;
assign bcd10=bcd10r;
always @(posedge clk or negedge cr)
	if(!cr)
		bcd10r<=4'b0000;
		else if(en)
			if(bcd10r<9)
				bcd10r<=bcd10r+1'b1;
			else
			bcd10r<=0;
		else bcd10r<=bcd10r;

endmodule
