`timescale 1ns / 1ps

module c6(
	input clk,
	input cr,
	output rco,
	input en,
	output [3:0] bcd6
    );
reg [3:0] bcd6r;
assign rco=(bcd6r==5)?1'b1:1'b0;
assign bcd6=bcd6r;
always @(posedge clk or negedge cr)
	if(!cr)
		bcd6r<=4'b0000;
		else if(en)
			if(bcd6r!=5)
				bcd6r<=bcd6r+1'b1;
			else
			bcd6r<=0;
		else bcd6r<=bcd6r;
		
endmodule
