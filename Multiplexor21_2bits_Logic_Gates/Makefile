#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###

#******************************************************************************
############ MUX 2 TO 1 WITH RESET AND FF
#******************************************************************************

#******************************************************************************
# Modify this part with your own files.


TESTBENCHmuxrff = tb_mux21
SRCSmuxrff	  = $(TESTBENCHmuxrff).v
VCDmuxrff = mux2_1_con_Flip_flop
#******************************************************************************

#dependencies $ SRCSmuxrff

#Make trackead dependencies to generate objects, as everything is phony then everything runs
#lots of time is lost, so it only regenerates the ones that were changed.

#******************************************************************************
# Standard commands - Do not modify
#******************************************************************************
.PHONY: muxrff
muxrff: $(TESTBENCHmuxrff).vvp

#To create this file you need these files:
# $ @ replace left
# $ ^ right

#each time you are asked for a vvp you need one with con.v
%.vvp: ./testbenches/%.v
	iverilog -o $@ $^
#simulate the dump

#To generate these two files I need this
$(VCDmuxrff).vcd $(TESTBENCHmuxrff)_log.txt: $(TESTBENCHmuxrff).vvp
# this is how it does it
	vvp $^ > $(TESTBENCHmuxrff)_log.txt


#target phony
.PHONY: gtkwavemuxrff
gtkwavemuxrff: $(VCDmuxrff).vcd
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $^

#******************************************************************************
# 						CLEAN
#******************************************************************************

.PHONY: clean
clean:
	rm -rf *.vvp *.vcd *_log.txt *.out *syn.v
