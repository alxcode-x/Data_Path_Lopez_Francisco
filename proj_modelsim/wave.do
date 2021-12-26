onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB /Data_Path_TB/clk
add wave -noupdate -expand -group TB /Data_Path_TB/reset
add wave -noupdate -expand -group TB -radix hexadecimal /Data_Path_TB/Result_tb
add wave -noupdate -expand -group PC /Data_Path_TB/DP/PROGRAM_COUNTER/data_o
add wave -noupdate -expand -group ALU /Data_Path_TB/DP/ALUIF/a
add wave -noupdate -expand -group ALU -radix hexadecimal /Data_Path_TB/DP/ALUIF/b
add wave -noupdate -expand -group ALU /Data_Path_TB/DP/ALUIF/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {44 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {40 ps} {120 ps}
