# Recreate Vivado projects from the tracked RTL and testbench sources.
# Usage:
#   vivado -mode batch -source scripts/create_vivado_project.tcl
#   vivado -mode batch -source scripts/create_vivado_project.tcl -tclargs 06_vending_machine

set part "xc7vx485tffg1157-1"
set projects {
    {01_adders                 four_bit_ripple_adder       four_bit_ripple_adder_tb}
    {02_mux_demux              mux_4to1                    mux_4to1_tb}
    {03_t_flipflop             t_flipflop                  t_flipflop_tb}
    {04_moore_1011_detector    moore_1011                  tb_moore_1011}
    {05_parking_lot_controller parking_lot_controller      tb_parking_lot_controller}
    {06_vending_machine        vending_machine             vending_machine_tb}
}

set root [file normalize [file dirname [info script]]/..]
set only [expr {$argc > 0 ? [lindex $argv 0] : ""}]

foreach p $projects {
    lassign $p dir top tb
    if {$only ne "" && $only ne $dir} { continue }
    set proj_dir "$root/vivado_build/$dir"
    file delete -force $proj_dir
    create_project $dir $proj_dir -part $part
    add_files [glob $root/$dir/rtl/*.v]
    add_files -fileset sim_1 [glob $root/$dir/testbench/*.v]
    set_property top $top [current_fileset]
    set_property top $tb [get_filesets sim_1]
    update_compile_order -fileset sources_1
    puts "Created $dir"
    close_project
}
