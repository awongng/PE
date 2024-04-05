`timescale 1 ns/ 1 ps

//testbench subtractor pour n bit
module subtractor_n_tb ();

//	logic [2:0] a_i_s;
//	logic [2:0] b_i_s;
//	logic borrow_o_s;
//	logic [2:0] diff_o_s;

	logic a_i_s;
	logic b_i_s;
	logic borrow_o_s;
	logic diff_o_s;

//DUT
//	subtractor_n #(.nb_bit(3)) DUT (
//		.a_i(a_i_s),
//		.b_i(b_i_s),
//		.borrow_o(borrow_o_s),
//		.diff_o(diff_o_s)	
//	);

	subtractor_n #(.nb_bit(1)) DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

//stimuli generation
	initial 
		begin
			a_i_s = '0;
			b_i_s = '0;
//			#5 a_i_s = 3'b101;
//			#5 b_i_s = 3'b011;
			#5 a_i_s = 1;
			#5 b_i_s = 1;
			#5 a_i_s = 0;
			
		end

endmodule : subtractor_n_tb
