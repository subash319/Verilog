//dual port ram- This is one form of memory where you have seperate buses
// for read and write. From this we can infer that on the same cycle
// we can do read and write parllely

// reference- maven silicon-verilog programming series

module dual_port_ram
#(	parameter RAM_WIDTH = 8,
	parameter RAM_DEPTH = 256,
	parameter ADDR_WIDTH = 8
)
(
input clk,
input rst,
//write interface
input wr_en,
input [ADDR_WIDTH-1:0] wr_addr,
input [RAM_WIDTH-1:0] data_in,
//read interface
input rd_en,
input [ADDR_WIDTH-1:0] rd_addr,
output reg [RAM_WIDTH-1:0] data_out
);

//memory declaration
reg	[RAM_WIDTH-1:0]mem[RAM_DEPTH-1:0];
integer i;

always@(posedge clk)
begin
	if (rst)
	begin
		for(i=0; i<RAM_DEPTH; i= i+1)
			mem[i]	<= 0;
	end
	else
	begin
		if(wr_en)
			mem[wr_addr]<=	data_in;
		if(rd_en)
			data_out	<=	mem[rd_addr];
	end
end
endmodule