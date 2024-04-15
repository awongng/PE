//red_d_simpletb.sv
//Test bench for the Barrett reduction for Dilithium on specified values

`timescale 1 ns/ 1 ps

module red_d_simpletb ();
	logic [45:0] product_i_s;
	logic [22:0] result_o_s;

	red_d DUT (
		.product_i(product_i_s),
		.result_o(result_o_s)
	);

//Stimuli generation
	initial begin
		product_i_s = 838041;
		//Expected result : d838041,hC999
		#5 product_i_s = 8380418;
		//Expected result : d1,h1
		#5 product_i_s = 96745219;	
		//Expected result : d4560632,h4596F8

	end
   

endmodule : red_d_simpletb
