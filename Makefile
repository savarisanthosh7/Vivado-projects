.PHONY: test clean

IVERILOG ?= iverilog
VVP ?= vvp
BUILD := build

test:
	@mkdir -p $(BUILD)
	$(IVERILOG) -g2012 -o $(BUILD)/full_adder 01_adders/rtl/*.v 01_adders/testbench/full_adder_tb.v
	$(VVP) $(BUILD)/full_adder
	$(IVERILOG) -g2012 -o $(BUILD)/three_bit_adder 01_adders/rtl/*.v 01_adders/testbench/three_bit_ripple_adder_tb.v
	$(VVP) $(BUILD)/three_bit_adder
	$(IVERILOG) -g2012 -o $(BUILD)/four_bit_adder 01_adders/rtl/*.v 01_adders/testbench/four_bit_ripple_adder_tb.v
	$(VVP) $(BUILD)/four_bit_adder
	$(IVERILOG) -g2012 -o $(BUILD)/mux 02_mux_demux/rtl/mux_4to1.v 02_mux_demux/testbench/mux_4to1_tb.v
	$(VVP) $(BUILD)/mux
	$(IVERILOG) -g2012 -o $(BUILD)/demux 02_mux_demux/rtl/demux_1to4.v 02_mux_demux/testbench/demux_1to4_tb.v
	$(VVP) $(BUILD)/demux
	$(IVERILOG) -g2012 -o $(BUILD)/tff 03_t_flipflop/rtl/t_flipflop.v 03_t_flipflop/testbench/t_flipflop_tb.v
	$(VVP) $(BUILD)/tff
	$(IVERILOG) -g2012 -o $(BUILD)/moore 04_moore_1011_detector/rtl/moore_1011.v 04_moore_1011_detector/testbench/tb_moore_1011.v
	$(VVP) $(BUILD)/moore
	$(IVERILOG) -g2012 -o $(BUILD)/parking 05_parking_lot_controller/rtl/parking_lot_controller.v 05_parking_lot_controller/testbench/tb_parking_lot_controller.v
	$(VVP) $(BUILD)/parking
	$(IVERILOG) -g2012 -o $(BUILD)/vending 06_vending_machine/rtl/vending_machine.v 06_vending_machine/testbench/vending_machine_tb.v
	$(VVP) $(BUILD)/vending

clean:
	rm -rf $(BUILD)
