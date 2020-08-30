#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###

#******************************************************************************
# Modify this part with your own files.


TESTBENCHelements = tb_elements
SRCSelements	  = $(TESTBENCHelements).v
VCDelements = t_and_two_input_gate t_flip_flop_single_type_D t_inversor_as_not_gate t_mux2_1_1bit t_mux2_1_2bit t_or_two_input_gate
SRC = ./src/
TESTERS = ./testers/
TESTBENCHES = ./testbenches/
#******************************************************************************

#dependencies $ SRCSelements

#Make trackead dependencies to generate objects, as everything is phony then everything runs
#lots of time is lost, so it only regenerates the ones that were changed.

#******************************************************************************
# Standard commands design elements - Do not modify
#******************************************************************************
all: desingelements


.PHONY: desingelements
desingelements: $(TESTBENCHelements).vvp

#To create this file you need these files:
# $ @ replace left
# $ ^ right

#each time you are asked for a vvp you need one with con.v
%.vvp: $(TESTBENCHES)%.v
	iverilog -o $@ $^
#simulate the dump

#To generate these two files I need this
$(VCDelements).vcd $(TESTBENCHelements)_log.txt: $(TESTBENCHelements).vvp
# this is how it does it
	vvp $^ > $(TESTBENCHelements)_log.txt

#target phony
.PHONY: gtkwaveelements
gtkwaveelements: $(VCDelements).vcd
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $^


#*****************************************************************************
# 						CLEAN
#*****************************************************************************

.PHONY: clean
clean:
	rm -rf *.vvp *.vcd *_log.txt *.out *syn.v
