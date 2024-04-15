# Description of the implementation

The goal of this implementation is to describe a custom ALU as defined in Miteloudi, K., Bos, J., Bronchain, O., Fay, B., & Renes, J. (1970, January 1). PQ.V.ALU.E: Post-quantum RISC-V custom alu extensions on dilithium and Kyber. Cryptology ePrint Archive. <https://eprint.iacr.org/2023/1505>.

## Development standards

### General standards

File, module and signal names use (```snake_case_convention```).

### Filesystem and filename standards

The project uses the following filesystem :

* [SRC](../SRC/) : Source files
  * [RTL](../SRC/RTL/) : Modules making the custom ALU
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

* Each ```*.sv``` file contains only one module, which has the same name as the file.
* Signals :
  * Input signals suffix : ```*_i```
  * Output signals suffix : ```*_o```
  * Internal signals suffix : ```*_s```
  * In testbenches : Signals wired on inputs or outputs of the device under test use the same name (including original suffix ```*_i``` or ```*_o```) with the suffix ```*_s``` added.
