onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dual_port_ram_tb/clk
add wave -noupdate /dual_port_ram_tb/rst
add wave -noupdate /dual_port_ram_tb/wr_en
add wave -noupdate /dual_port_ram_tb/wr_addr
add wave -noupdate /dual_port_ram_tb/data_in
add wave -noupdate /dual_port_ram_tb/rd_en
add wave -noupdate /dual_port_ram_tb/rd_addr
add wave -noupdate /dual_port_ram_tb/data_out
add wave -noupdate /dual_port_ram_tb/DUT/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36701 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
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
WaveRestoreZoom {0 ps} {210 ns}
