`timescale 1ns/1ps 
module FIFObuffer_tb();

reg [31:0] data_in;
reg clk;
reg en;
reg re;
reg rst;
reg we;	
wire [31:0] data_out;
wire Empty;
wire Full;

//Instantiate the Design Under Test (DUT)

FIFObuffer DUT
(
	.data_in(data_in),
	.clk(clk),
	.re(re),
	.rst(rst),
	.we(we),
	.data_out(data_out),
	.Empty(Empty),
	.Full(Full)
);
initial begin
	clk = 1'b0;
	data_in = 32'h0;
	re = 1'b0;
	we = 1'b0;
	rst= 1'b1;
	// Wait for 100ns
	#100
	//Adding the stimulus here
	rst= 1'b0;
	we = 1'b1;
	data_in = 32'h0;
	#20
	data_in = 32'h1;
	#20
	data_in = 32'h2;
	#20
	data_in = 32'h3;	
	#20
	data_in = 32'h4;
	#20
	we = 1'b0;
	re = 1'b1;
end
always #10 clk = ~clk;

endmodule