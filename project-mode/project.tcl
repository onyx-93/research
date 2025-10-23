# project_build.tcl
# Vivado 2025.1 -- Arty A7-100T inverter project

set proj_name "Inverter"
set proj_dir  "./$proj_name"

# Arty A7-100T part
set part "xc7a100tcsg324-1"

# Top-level module
set top "top"

# Folder containing source files
set src_dir "./src"

# Path to constraints file
set xdc "./pin_setting.xdc"

# Clean up existing project if it exists
if {[file exists $proj_dir]} {
    file delete -force $proj_dir
}

# Create project
create_project $proj_name $proj_dir -part $part -force

# Add SystemVerilog source files
add_files [glob -nocomplain -directory $src_dir *.sv]

# Add constraints file
if {[file exists $xdc]} {
    add_files -fileset constrs_1 $xdc
} else {
    puts "WARNING: No XDC found at $xdc"
}

# Set the top-level module
set_property top $top [get_filesets sources_1]

# Update compile order
update_compile_order -fileset sources_1

# Run synthesis
launch_runs synth_1 -jobs 4
wait_on_run synth_1

# Run implementation through bitstream generation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# Export bitstream
set bitfile "$proj_dir/${proj_name}.runs/impl_1/${top}.bit"
puts "Build complete! Bitstream at: $bitfile"
