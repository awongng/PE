# Test file formatting

This document describes the format of files used in the test benches.
The test values are stored in [TestBenchFiles](../TestBenchFiles/) with the suffix ```*_test_val.txt```.
The python code in [Tools](../Tools/) was used to generate them.

## Format for each line
Each line is comprised of random input(s) and the expected output(s).
The values on a line are separated by a space.

* Barrett reduction for Dilithium (1 input, 1 output)
	* ```product_i result_o```

* Modular multiplication (3 inputs, 1 output)
	* ```a_i b_i red_i c_o```

* Butterfly (5 inputs, 2 outputs)
	* ```a_i b_i twiddle_i sel_red_i sel_butterfly_i a_o b_o ```


