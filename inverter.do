# Use this run.do file to run the inverter example with clock waveform

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog inverter.sv inverter_tb.sv

# start simulation (top-level testbench)
vsim -voptargs=+acc work.tb_inverter

view list
view wave

# Add signals to waveform viewer
add wave -divider "Clock"
add wave -hex /tb_inverter/clk

add wave -divider "Inputs"
add wave -hex /tb_inverter/a

add wave -divider "Outputs"
add wave -hex /tb_inverter/y

# Waveform formatting
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ns} {100 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

# Run the simulation
run 100ns
