`timescale 1 ns/ 1 ps

//testbench reduction barrett dilithium
module red_d_simpletb ();

	logic [45:0] product_i_s;
	logic [22:0] result_o_s;

//DUT
	red_d DUT (
		.product_i(product_i_s),
		.result_o(result_o_s)
	);

//stimuli generation
	initial begin
		product_i_s = 838041;
// expected 838041 0hc999
		#5 product_i_s = 8380418;
// expected 1
		#5 product_i_s = 96745219;	
// expected 4560632 0h4596f8

	end
   

endmodule : red_d_simpletb
