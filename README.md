# Description

Implementation in System Verilog of custom ALU described in : \
Miteloudi, K., Bos, J., Bronchain, O., Fay, B., & Renes, J. (1970, January 1). PQ.V.ALU.E: Post-quantum RISC-V custom alu extensions on dilithium and Kyber. Cryptology ePrint Archive. <https://eprint.iacr.org/2023/1505>

## Requirements

A Linux environment with Modelsim is required to use the compilation and simulation parameters of this project.
You may use other means of compiling and simulating SystemVerilog files, but may have to make your equivalents to ```init.txt``` and ```make.txt```.

## Usage

Initialize environment with ```source init.txt```.
Compile with ```source make.txt```.
Simulate test benches with ```vsim -L LIB_RTL LIB_BENCH.name_of_testbench_module```.

Additional information can be found in [Usage](./Docs/Usage.md) documentation.

## Documentation

Additionnal documentation can be found in the [Docs](./Docs/) folder.

* [Implementation](./Docs/Implementation.md) : How the work is implemented and notes for developpers
* [Usage](./Docs/Usage.md) : How to use the existing work
* [Security of the implementation](./Docs/Security.md) : Considerations on the security of the work, vulnerabilities and counter-measures
