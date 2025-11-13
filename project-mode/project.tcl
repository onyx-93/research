# ============================================================
# project_build.tcl
# Vivado 2025.1 -- Arty A7-100T inverter project with ILA debug
# ============================================================

set proj_name "Inverter"
set proj_dir  "./$proj_name"

# Arty A7-100T part
set part "xc7a100tcsg324-1"

# Top-level module
set top "top"

# Folder containing source files
set src_dir "./src"

# Path to main constraints file
set xdc "./pin_setting.xdc"

# Path to ILA constraints file
set ila_xdc "./small-debug.xdc"

# ------------------------------------------------------------
# Clean up existing project if it exists
# ------------------------------------------------------------
if {[file exists $proj_dir]} {
    file delete -force $proj_dir
}

# ------------------------------------------------------------
# Create new project
# ------------------------------------------------------------
create_project $proj_name $proj_dir -part $part -force

# Add SystemVerilog source files
add_files [glob -nocomplain -directory $src_dir *.sv]

# Add constraints files
if {[file exists $xdc]} {
    add_files -fileset constrs_1 $xdc
    read_xdc $xdc
} else {
    puts "WARNING: No XDC found at $xdc"
}


# ------------------------------------------------------------
# Set properties and run synthesis
# ------------------------------------------------------------
set_property top $top [get_filesets sources_1]
update_compile_order -fileset sources_1

# Run synthesis
launch_runs synth_1 -jobs 4
wait_on_run synth_1
open_run synth_1

# Add ILA constraints file if it exists
if {[file exists $ila_xdc]} {
    source $ila_xdc
    puts "INFO: Sourced ILA constraints from $ila_xdc"
} else {
    puts "WARNING: No ILA constraints found at $ila_xdc"
}

# Run implementation through bitstream generation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1

# ------------------------------------------------------------
# Export bitstream
# ------------------------------------------------------------
set bitfile "$proj_dir/${proj_name}.runs/impl_1/${top}.bit"
puts "Build complete! Bitstream at: $bitfile"
