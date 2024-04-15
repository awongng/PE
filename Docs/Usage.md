# Basic usage

A linux environment with Modelsim is required to use the compilation and simulation parameters of this project.
You may use other means of compiling and simulating SystemVerilog files, but may have to make your equivalents to ```init.txt``` and ```make.txt```.
All documentation and tools assume all commands are run in a terminal in the project's root.

## Compilation

Verify that ```init.txt``` points to the right files.
Initialize environment with ```source init.txt```.

Compile with ```source make.txt```.

With this script, Modelsim refreshes libraries at the end of compilation so that you do not need to do so manually (the change may not be visible in the library dropdown but will be effective).

### Alternative compilation option

For faster debugging purposes, using ```source clean_make.txt``` makes compilation less verbose.
It uses an alternative ```make2.txt``` file, which is not in the repository. Use ```cp make.txt make2.txt``` to copy the default one.

## Simulation

This implementation includes test benches for every module, found in [SRC/BENCH](../SRC/BENCH/). In order to simulate a test_bench, use ```vsim -L LIB_RTL LIB_BENCH.module_name_suffixtb```. Note that you should not include the ```.sv``` filename extension in this command.

### Random seed setting

Some test benches use verilog's built-in ```$urandom()``` or ```$urandom_range()``` functions.
Setting the seed should be done at run time with the following argument added to the ```vsim``` command : ```-sv_seed VALUE```, where VALUE is an integer or ```random```

Note that when using ```-sv_seed random```, the seed is printed on your terminal so that you may use it later to reproduce observed behavior.
