# Use this run.do file to run the inverter example.
# Run in ModelSim/QuestaSim console:
#   do run.do
# Or from shell:
#   vsim -do run.do -c
# (omit -c to open GUI)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog inverter.sv inverter_tb.sv

# start simulation (top-level is tb_inverter)
vsim -voptargs=+acc work.tb_inverter

view list
view wave

# Add DUT signals to waveform
add wave -divider "Inputs"
add wave -hex /tb_inverter/a

add wave -divider "Outputs"
add wave -hex /tb_inverter/y

# If you want to view inside the DUT:
# add wave -hex /tb_inverter/uut/*

# Waveform viewer formatting
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ns} {50 ns}
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
