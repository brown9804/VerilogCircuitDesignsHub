# Multiplexor 2:1 2 bits structural with YOSYS synthesis


Includes:
Mux 2:1 2bits behavioral


* First you have to synthesize the conductual in order to obtain the Verilog RTL so in the absolute path:

~~~
Absolut_path_of_the_folder$ make yosys 
~~~

* Then you have to rename the module created by yosys, so you do the following command that calls sed command from the makefile: 

~~~
Absolut_path_of_the_folder$ make replace
~~~


* Finally, you want to simulate HDL:

~~~~
Absolut_path_of_the_folder$ make 
~~~~


* Use the gtkwave viewer:

~~~~
Absolut_path_of_the_folder$ make gtkwave
~~~~

* If you want to delete the files created

~~~~
Absolut_path_of_the_folder$ make clean
~~~~



### Important:
Read the makefile because it's using a path to access Gtkwave on OSX
