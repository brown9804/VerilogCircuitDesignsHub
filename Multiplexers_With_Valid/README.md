# Multiplexers with bit valid 

1. For 				mux 2:1 2 bits	....	 	# =	0
2. For 				mux 2:1 4 bits 	....		# =	1
3. For 				mux 4:1 4 bits 	....		# = 2


### 						YOSYS 		(use $make	y#)
To generate the structural design of the behavioral design automatically through synthesis.
It is defined as a roughly RTL (Register Transfer Level) synthesizer that allows you to convert the HDL (Hardware
Description Language) code into an electronic scheme. Coming to show the components connected to each other what
is usually called RTL network list which is associated with the level of registry transfer. Considering that what 
it allows is to model a synchronous digital circuit in terms of digital signal flow (this being data) relating 
it to the hardware registers and the logical operations that are carried out in each signal.


### 						SED				(use $make	r#)
Replaces on the synthesized file the name module, because for making the stuctural decription we use the
behavioral on yosys.


### 					 IVERILOG 		(use $make v#)
It is defined as an HDL (Hardware Description Language), this being a modeled hardware language, that is, it allows
describing a simulation of digital circuits. It can be seen as the tool that allows to provide the specifications to carry
out a physical component which is being modeled. 


### 					GTKWAVE   		(use $make gtkwave#)
We can define it as a visualization of simulation results where one of its advantages is that by means of a visualization
of signal waves we can understand the problem when it is found by using the testbench.


###                  Instructions 
* First you have to synthesize the conductual in order to obtain the Verilog RTL so in the absolute path:

~~~
Absolut_path_of_the_folder$ make y# 
~~~

* Then you have to rename the module created by yosys, so you do the following command that calls sed command from the makefile: 

~~~
Absolut_path_of_the_folder$ make r#
~~~


* Finally, you want to simulate HDL:

~~~~
Absolut_path_of_the_folder$ make v#
~~~~


* Use the gtkwave viewer:

~~~~
Absolut_path_of_the_folder$ make gtkwave#
~~~~

* If you want to delete the files created

~~~~
Absolut_path_of_the_folder$ make clean
~~~~



### Important:
Read the makefile because it's using a path to access Gtkwave on OSX
