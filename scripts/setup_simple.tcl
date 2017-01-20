# get the directory where this script resides
set thisDir [file dirname [info script]]
# source common utilities
source -notrace $thisDir/utils.tcl

set hdlRoot ../hdl
set xdcRoot ../xdc

# Create project
create_project -force top ./top/ -part xc7k325tffg900-2

# Set project properties
set obj [get_projects top]
set_property "board_part" "xilinx.com:kc705:part0:1.2" $obj
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "Verilog" $obj

add_files -norecurse $hdlRoot/top/top_simple.v
add_files -norecurse $hdlRoot/threeFlop/threeFlop.v
add_files -norecurse $xdcRoot/top.xdc
add_files -norecurse $xdcRoot/top_io_simple.xdc

# If successful, "touch" a file so the make utility will know it's done 
touch {.setup.done}
