# Description of the implementation

The goal of this implementation is to describe a custom ALU as defined in Miteloudi, K., Bos, J., Bronchain, O., Fay, B., & Renes, J. (1970, January 1). PQ.V.ALU.E: Post-quantum RISC-V custom alu extensions on dilithium and Kyber. Cryptology ePrint Archive. <https://eprint.iacr.org/2023/1505>.

## Development standards

### General standards

File, module and signal names use ```snake_case_convention```:

* Everything in lowercase
* Words separated by an underscore

### Filesystem and filename standards

The project uses the following filesystem :

* [SRC](../SRC/) : Source files
  * [RTL](../SRC/RTL/) : Modules in the custom ALU
    * Each file corresponds to a single module
  * [BENCH](../SRC/BENCH/) : Premade test benches
    File names do not exactly follow ```snake_case_convention``` here, the following suffixes ommit underscores :
    * ```*_simpletb.sv``` : Values are given in the file
    * ```*_fulltb.sv``` : All possible values are tested, see the file's description for details
    * ```*_randtb.sv``` : Values are random, see [Random seeding](./Usage.md) for more information
    * ```*_filetb.sv``` : Values are given in a separate file, see [Test file formatting](../TestBenchFiles/TBFilesFormatting.md) for more information
* LIB : Modelsim libraries, generated at compile time
  * LIB_RTL : Libraries for modules
  * LIB_BENCH : Libraries for test benches
* [TestBenchFiles](../TestBenchFiles/) : Files used for chosen values benchmarking

### SystemVerilog code standards

* Templates are provided for both modules ([RTL_template.sv](../SRC/RTL/RTL_template.sv)) and test benches ([BENCH_template.sv](../SRC/BENCH/BENCH_template.sv))
  * Following the templates is not required, they are provided for indicative purposes only
* Each ```*.sv``` file contains only one module, which has the same name as the file
* Signals :
  * Input signals suffix : ```*_i```
  * Output signals suffix : ```*_o```
  * Internal signals suffix : ```*_s```
  * In testbenches : Signals wired on inputs or outputs of the device under test use the same name (including original suffix ```*_i``` or ```*_o```) with the suffix ```*_s``` added.
* Indentation is not standardised in this project as it does not hinder the readability of the code
