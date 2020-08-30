#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###

#******************************************************************************
# Modify this part with your own files.


TESTBENCH = tb_passive
SRCS	  = $(TESTBENCH).v
VCD = Passive

#******************************************************************************

#dependencies $ SRCS

#Make trackead dependencies to generate objects, as everything is phony then everything runs
#lots of time is lost, so it only regenerates the ones that were changed.

#******************************************************************************
# Standard commands - Do not modify
#******************************************************************************
.PHONY: all
all: $(TESTBENCH).vvp

.PHONY: lint
lint:
	verilator --lint-only $(SRCS)

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

.PHONY: yosys
yosys:
		yosys ./yosys/filesonyosys.ys

#Replace synth module name
replace:
	sed -i 's/Passive_b/Passive_syn/g' Passive_syn.v


#AUTOINST
# You can autoinst whatever script that need to update
autoinst:
	emacs --batch ./src/Passive_b_autoinst.v -f verilog-batch-auto



#target phony
.PHONY: gtkwave
gtkwave: $(VCD).vcd
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $^

.PHONY: clean
clean:
	rm -rf *.vvp *.vcd *_log.txt *.out *syn.v
