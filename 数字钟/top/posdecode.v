`timescale 1ns / 1ps

module posdecode(
    input [3:0] bcd6,
    output [7:0] pos
    );
reg [7:0] posr;
assign pos=posr;
always @(bcd6)
case (bcd6)
4'b0000:posr<=8'b11011111;
4'b0001:posr<=8'b11101111;
4'b0010:posr<=8'b11110111;
4'b0011:posr<=8'b11111011;
4'b0100:posr<=8'b11111101;
4'b0101:posr<=8'b11111110;
default:posr<=8'b11111111;
endcase

endmodule
