# Description

Implementation in System Verilog of custom ALU described in : \
Miteloudi, K., Bos, J., Bronchain, O., Fay, B., & Renes, J. (1970, January 1). PQ.V.ALU.E: Post-quantum RISC-V custom alu extensions on dilithium and Kyber. Cryptology ePrint Archive. <https://eprint.iacr.org/2023/1505>

## Requirements

Linux environment with Modelsim

## Usage

Initialize environment with ```source init.txt```
Compile with ```source make.txt```
Additional information for compilation and simulation available in ```make.txt```

### Alternative compilation option

For faster debugging purposes, using ```source clean_make.txt``` makes compilation less verbose.
It uses an alternative ```make2.txt``` file, which is not in the repository. Use ```cp make.txt make2.txt``` to copy the default one.
