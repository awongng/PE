//subtractor_8_fulltb.sv
//Test bench complet du soustracteur sur 8 bits

//Simuler 65535ns = 2**16

`timescale 1 ns/ 1 ps

module subtractor_8_fulltb ();

	logic [15:0] test_vector_s;
	logic [7:0] a_i_s, b_i_s, diff_o_s;
	logic borrow_o_s;

	logic correct_s;

	assign a_i_s = test_vector_s[15:8];
	assign b_i_s = test_vector_s[7:0];
	subtractor_n #(.nb_bit(8)) DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

	assign correct_s = (borrow_o_s === (a_i_s < b_i_s)) && ((a_i_s <= b_i_s) || (diff_o_s === (a_i_s - b_i_s)));

//stimuli generation
	initial begin
		test_vector_s = 16'h0;
		forever #1 test_vector_s = test_vector_s + 1;
	end

endmodule : subtractor_8_fulltb
