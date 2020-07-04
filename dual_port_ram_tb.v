`timescale 1ns/1ps 
module dual_port_ram_tb
#(	parameter RAM_WIDTH = 8,
	parameter RAM_DEPTH = 256,
	parameter ADDR_WIDTH = 8
)
();


reg clk;
reg rst;
//write interface
reg wr_en;
reg [ADDR_WIDTH-1:0] wr_addr;
reg [RAM_WIDTH-1:0] data_in;
//read interface
reg rd_en;
reg [ADDR_WIDTH-1:0] rd_addr;
wire [RAM_WIDTH-1:0] data_out;

dual_port_ram DUT
(
	.clk(clk),
	.rst(rst),
	.wr_en(wr_en),
	.wr_addr(wr_addr),
	.data_in(data_in),
	.rd_en(rd_en),
	.rd_addr(rd_addr),
	.data_out(data_out)
);

initial
begin
	clk = 1'b0;
	rst = 1'b1;
	wr_en = 1'b0;
	wr_addr = 8'b0;
	data_in = 8'b0;
	rd_addr = 8'b0;
	#50
	//wait for 50ns
	rst = 1'b0;
	wr_en = 1'b1;
	wr_addr = 8'h0;
	data_in = 8'h11;
	#20
	wr_addr = 8'h1;
	data_in = 8'h12;
	rd_en = 1'b1;
	rd_addr = 8'h0;
	#20
	wr_addr = 8'h2;
	data_in = 8'h13;
	rd_addr = 8'h1;
	#20
	wr_addr = 8'h3;
	data_in = 8'h14;
	rd_addr = 8'h2;
	#20
	rd_en = 1'b0;
	
end
always #10 clk = ~clk;
endmodule