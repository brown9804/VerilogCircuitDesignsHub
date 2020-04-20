#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.
###
######## belindabrownr@gmail.com
###

#******************************************************************************
# Modify this part with your own files.


TESTBENCH = tester
SRCS	  = $(TESTBENCH).v
VCD = Car_Alarm
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
%.vvp: %.v
	iverilog -o $@ $^
#simulate the dump

#To generate these two files I need this
$(VCD).vcd $(TESTBENCH)_log.txt: $(TESTBENCH).vvp
# this is how it does it
	vvp $^ > $(TESTBENCH)_log.txt

.PHONY: yosys
yosys:
		yosys filesonyosys.ys
#in this carpet is not created Alarm_Behavioral_Description_copy.v but if you want you can do it, by copying the file Alarm_Behavioral_Description.v
# and renames the new file by Alarm_Behavioral_Description_copy.v
#replace occurrences of "Alarm_Behavioral_Description" with "Alarm_Behavioral_Descriptionsynth" in Alarm_Behavioral_Description_copy.v
replace:
	sed -i 's/Alarm_Behavioral_Description/Alarm_Behavioral_Descriptionsynth/g' Alarm_Behavioral_Description_copy.v


#AUTOINST
autoinst:
	emacs --batch CarAlarm_autoinst.v -f verilog-batch-auto



#target phony
.PHONY: gtkwave
gtkwave: $(VCD).vcd
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $^

.PHONY: clean
clean:
	rm -rf $(TESTBENCH).vvp $(VCD).vcd $(TESTBENCH)_log.txt *.out *syn.v
