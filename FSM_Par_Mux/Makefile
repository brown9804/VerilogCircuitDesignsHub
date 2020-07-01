#Verilog

# Making verilog makefile
# Makefile to simulate Verilog HDL designs under OSX.

##--------------------------------Makefile------------------------------------
##
##			 Copyright (C) 2020 by 
##		Belinda Brown Ramírez (belindabrownr04@gmail.com)
##	
##
##-----------------------------------------------------------------------------



# 							Makefile logic:
# To create this file you need these files:
# $ @ replace left
# $ ^ right


#******************************************************************************
#													MARKS
#******************************************************************************
# 1. For state machine and a parameterized multiplexer ---------- fsm_mux



all:

#******************************************************************************
#										TARGETS
#******************************************************************************
### 						YOSYS 		use $make	y<mark>
# To generate the structural design of the
# behavioral design automatically through synthesis
#It is defined as a roughly RTL (Register Transfer Level)
#synthesizer that allows you to convert the HDL (Hardware
# Description Language) code into an electronic scheme.
# Coming to show the components connected to each other what
# is usually called RTL network list which is associated with
# the level of registry transfer. Considering that what it allows
# is to model a synchronous digital circuit in terms of digital signal
# flow (this being data) relating it to the hardware registers and the
# logical operations that are carried out in each signal.


### 						SED				use $make	r<mark>
# Replaces on the synthesized file the name module,
# because for making the stuctural decription we use the
# behavioral on yosys

#### 					 IVERILOG 		use $make v<mark>
# It is defined as an HDL (Hardware Description Language),
#  this being a modeled hardware language, that is, it allows
#  describing a simulation of digital circuits. It can be seen
# as the tool that allows to provide the specifications to carry
# out a physical component which is being modeled.
# 	Example of command:
# iverilog -o ./vvp/TestBench_21_2.vvp ./TestBenchAUTONST/TestBench_21_2.v
# Its automatic, because each time you are asked for a vvp
# you need one with con.v

### 					GTKWAVE   		use $make gtkwave<mark>
# We can define it as a visualization of simulation results
# where one of its advantages is that by means of a visualization
# of signal waves we can understand the problem when it
# is found by using the testbench.

#******************************************************************************
# Modify this part with your own folders paths.

DIAGRAMS_GENERATED = ./diagrams_generated/

LIB = ./lib/

LOG_TXT = ./log_txt/

SRC = ./src/
_FSM_MUX = fsm_mux.v


SYN = ./syn/
_SFSM_MUX = fsm_mux_syn.v


TESTBENCHES = ./testbenches/
_TB_FSM_MUX =  tb_fsm_mux.v


TESTERS = ./testers/
_T_FSM_MUX = t_fsm_mux.v


_VCD_FSM_MUX = fsm_mux.vcd



OVVP = ./vvp/
_VVP_FSM_MUX = fsm_mux.vvp



YOSYS = ./yosys/
_Y_FSM_MUX = fsm_mux_y.ys


#******************************************************************************

# # IVERILOG
# %.vvp: %.v
# 	iverilog -o $@ $^


#******************************************************************************
#### 														FSM MUX
#******************************************************************************

yfsm_mux:
	yosys $(YOSYS)$(_Y_FSM_MUX)

rfsm_mux:
	sed -i ' s/fsm_par_mux/fsm_par_mux_syn/g; s/mem_module/mem_module_syn/g' $(SYN)$(_SFSM_MUX)

vfsm_mux:
	iverilog -o $(OVVP)$(_VVP_FSM_MUX) $(TESTBENCHES)$(_TB_FSM_MUX)
	vvp $(OVVP)$(_VVP_FSM_MUX) > $(LOG_TXT)$(_VVP_FSM_MUX)_log.txt

#target phony
.PHONY: gtkwavemux21
gtkwavefsm_mux:
	/Applications/gtkwave.app/Contents/Resources/bin/gtkwave $(_VCD_FSM_MUX)




#******************************************************************************
############ CLEAN FOR ALL
#******************************************************************************


.PHONY: clean
clean:
	rm -rf $(OVVP)*.vvp *.vcd $(LOG_TXT)*_log.txt $(SYN)*syn.v $(DIAGRAMS_GENERATED)*.dot $(DIAGRAMS_GENERATED)*.ps
