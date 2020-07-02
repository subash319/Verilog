onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FIFObuffer_tb/clk
add wave -noupdate /FIFObuffer_tb/rst
add wave -noupdate -divider {FIFO Write}
add wave -noupdate /FIFObuffer_tb/we
add wave -noupdate /FIFObuffer_tb/data_in
add wave -noupdate /FIFObuffer_tb/DUT/wptr
add wave -noupdate /FIFObuffer_tb/Full
add wave -noupdate /FIFObuffer_tb/DUT/FIFO
add wave -noupdate -divider read
add wave -noupdate /FIFObuffer_tb/Empty
add wave -noupdate /FIFObuffer_tb/re
add wave -noupdate /FIFObuffer_tb/DUT/rptr
add wave -noupdate /FIFObuffer_tb/data_out
add wave -noupdate /FIFObuffer_tb/DUT/Empty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {221000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {101 ns} {521 ns}
