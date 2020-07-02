vlog -reportprogress 300 -work work C:/Users/Subash/Desktop/Verilog_new/FIFObuffer.v
vlog -reportprogress 300 -work work C:/Users/Subash/Desktop/Verilog_new/FIFObuffer_tb.v
vsim FIFObuffer_tb
do wave.do
run 200ns