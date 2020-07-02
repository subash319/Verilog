module FIFObuffer
#(	parameter Datawidth = 32,
	parameter fifo_len = 8)
(
	input [31:0] data_in,
	input clk,
	input re,
	input rst,
	input we,
	output reg [31:0] data_out,
	output Empty,
	output Full
);

//Declaration of the FIFO memory
reg[Datawidth-1:0] FIFO[fifo_len-1:0];
reg [3:0] rptr;
reg [3:0] wptr;
assign Empty= (rptr == wptr)?1'b1:1'b0;
//One design technique used to distinguish between full and empty is to add an extra bit to each pointer. When the
//write pointer increments past the final FIFO address, the write pointer will increment the unused MSB while setting
//the rest of the bits back to zero as shown in Figure 1 (the FIFO has wrapped and toggled the pointer MSB). The
//same is done with the read pointer. If the MSBs of the two pointers are different, it means that the write pointer has
//wrapped one more time that the read pointer. If the MSBs of the two pointers are the same, it means that both
//pointers have wrapped the same number of times.
//assign Full= (~wptr[3],wptr[2:0] == rptr)?1'b1:1'b0;

assign Full= ({~wptr[3],wptr[2:0]} == rptr)?1'b1:1'b0;

always @(posedge clk)
begin
	if (rst) begin
		rptr = 0;
		wptr = 0;
	end
	else if(re == 1'b1 && Empty != 1 ) begin
		data_out = FIFO[rptr];
		rptr = rptr +1;
	end
	else if(we== 1'b1 && Full != 1 ) begin
		FIFO[wptr] = data_in;
		wptr = wptr+1;
	end
	//In a circular manner the wptr and rptr will be again pointed to initial
	//location if the FIFO is full
	//The MSB bit is used to check the FIFO full condition
	if(wptr == 8) begin
		wptr = 0;
	end
	else if(rptr == 8) begin
		rptr = 0;
	end
end
endmodule
