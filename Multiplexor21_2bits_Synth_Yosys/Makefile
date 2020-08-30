#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###

#******************************************************************************
# Modify this part with your own files.


TESTBENCH = tb_mux21
SRCS	  = $(TESTBENCH).v
VCD = mux2_1_con_Flip_flop
#******************************************************************************

#dependencies $ SRCS

#Make trackead dependencies to generate objects, as everything is phony then everything runs
#lots of time is lost, so it only regenerates the ones that were changed.

#******************************************************************************
# Standard commands - Do not modify
#******************************************************************************
.PHONY: all
all: $(TESTBENCH).vvp

#To create this file you need these files:
# $ @ replace left
# $ ^ right

#each time you are asked for a vvp you need one with con.v
%.vvp: ./testbenches/%.v
	iverilog -o $@ $^
#simulate the dump

#To generate these two files I need this
$(VCD).vcd $(TESTBENCH)_log.txt: $(TESTBENCH).vvp
# this is how it does it
	vvp $^ > $(TESTBENCH)_log.txt

# To generate the structural design of the
# behavioral design automatically through synthesis
.PHONY: yosys
yosys:
	 yosys ./yosys/filesonyosys.ys




# Replace occurrences of "mux2_1" with "mux2_1_synth" in mux21behavioral_syn.v
replace:
	sed -i 's/mux21/mux21_synth/g' mux21behavioral_syn.v


#target phony
.PHONY: gtkwave
gtkwave: $(VCD).vcd
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $^

.PHONY: clean
clean:
	rm -rf *.vvp *.vcd *_log.txt *.out *syn.v
