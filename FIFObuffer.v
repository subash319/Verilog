module FIFObuffer
#(	parameter Datawidth = 32,
	parameter fifo_len = 8)
(
	input [31:0] data_in,
	input clk,
	input en,
	input re,
	input rst,
	input we,
	output reg [31:0] data_out,
	output Empty,
	output Full
);
//Counts the number of items in a FIFO
reg [3:0] Count =0;

//Declaration of the FIFO memory
reg[Datawidth-1:0] FIFO[fifo_len-1:0];
reg [2:0] rptr;
reg [3:0] wptr;
assign Empty= (Count == 0)?1'b1:1'b0;
assign Full= (Count == fifo_len)?1'b1:1'b0;

always @(posedge clk)
begin
	if (rst) begin
		rptr = 0;
		wptr = 0;
	end
	else if(re == 1'b1 && Count != 0 ) begin
		data_out = FIFO[rptr];
		rptr = rptr +1;
	end
	else if(we== 1'b1 && Count <8 ) begin
		FIFO[wptr] = data_in;
		wptr = wptr+1;
	end
	if (rptr > wptr) begin 
		Count=rptr-wptr; 
	end 

	else if (wptr > rptr) begin 	
		Count=wptr-rptr;
	end
	else;
	//In a circular manner the wptr and rptr will be again pointed to initial
	//location if the FIFO is full
	if(wptr == 8) begin
		wptr =0;
	end
	else if(rptr == 8) begin
		rptr =0;
	end
end
endmodule
