# Readme for Car's Passive Security

Device that detects the lights on in a car and emits a sound when the driver turns it off and leaves it. It is considered a low cost, compatible with a car battery, therefore it is required to be low consumption. It is considered important to emphasize that the ignition in a car is when the air and the fuel mix, allowing to sustain the chemical reaction that occurs by means of the heat that a reaction emits when it becomes sufficient.

If you want to run the program, it is necessary to consider that the automated tasks are found through the make, therefore the following is followed:

* If you want to simulate HDL:

~~~~
Absolut_path_of_the_folder$ make
~~~~

* Use the yosys synthesizer:

~~~~
Absolut_path_of_the_folder$ make yosys
~~~~

* Use the gtkwave viewer:

~~~~
Absolut_path_of_the_folder$ make gtkwave
~~~~


* Apply the GNU sed function: (for this you must read the make since the file where sed is applied is not found in this folder since it was a copy of one of those present)

~~~~
Absolut_path_of_the_folder$ make sed
~~~~


* Use the Emacs plugin to instantiate a module:

~~~~
Absolut_path_of_the_folder$ make autoinst
~~~~
* For the use of verilator lint is applied by:

~~~~
Absolut_path_of_the_folder$ make lint
~~~~

* If you want to delete the files created

~~~~
Absolut_path_of_the_folder$ make clean
~~~~

### Important:
Read the makefile because it's using a path to access Gtkwave on OSX
