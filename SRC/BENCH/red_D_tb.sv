`timescale 1 ns/ 1 ps

//testbench reduction barrett dilithium
module red_D_tb ();

	logic [45:0] product_i_s;
	logic [22:0] result_o_s;

//DUT
	red_D DUT (
		.product_i(product_i_s),
		.result_o(result_o_s)
	);

//stimuli generation
   initial begin
      product_i_s = 96745219;
   end
   

endmodule : red_D_tb
