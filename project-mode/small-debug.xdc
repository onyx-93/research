## ------------------------------------------------------------
## ILA Debug Core Connections older version
## ------------------------------------------------------------

# Create the ILA debug core
#create_debug_core u_ila_0 ila

# Configure ILA depth and trigger options
#set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
# Optional advanced settings grouped
#startgroup 
#set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0 ]
#set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0 ]
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0 ]
#set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0 ]
#endgroup

# Connect the ILA to the system clock
#connect_debug_port u_ila_0/clk [get_nets CLK]

# Probe 0: Button input
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe0]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_ports {btn}]

# Probe 1: LED output
#create_debug_port u_ila_0 probe
#set_property port_width 1 [get_debug_ports u_ila_0/probe1]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_ports {led}]

# Connect the debug hub to the same clock
#connect_debug_port dbg_hub/clk [get_nets CLK]


## ------------------------------------------------------------
## ILA Debug Core Connections updated version
## -----

## Create ILA debug core
create_debug_core u_ila_0 ila

## Basic configuration
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]

## Optional advanced settings grouped
#startgroup
#set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 7 [get_debug_cores u_ila_0]
#endgroup

## Connect ILA clock (make sure this matches your design clock net)
connect_debug_port u_ila_0/clk [get_nets clk_internal]
connect_debug_port dbg_hub/clk [get_nets clk_internal]


## Probe 0: Reset button (btn[3])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets reset]

## Probe 1: Switch input bit 0 (sw[0])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets right]

## Probe 2: Switch input bit 1 (sw[1])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets left]

## Probe 3: LED bit 0 (led[0])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets led_internal[0]]

## Probe 4: LED bit 1 (led[1])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets led_internal[1]]

## Probe 5: LED bit 2 (led[2])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets led_internal[2]]

## Probe 6: LED bit 3 (led[3])
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets led_internal[3]]
