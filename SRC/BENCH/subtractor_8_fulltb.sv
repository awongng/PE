//subtractor_8_fulltb.sv
//Test bench complet du soustracteur sur 8 bits

`timescale 1 ns/ 1 ps

module subtractor_8_fulltb ();

	logic [15:0] test_vector_s;
	logic borrow_o_s;
	logic [7:0] diff_o_s;

	logic correct;

	subtractor_n #(.nb_bit(8)) DUT (
		.a_i(test_vector_s[15:8]),
		.b_i(test_vector_s[7:0]),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

	assign correct = (diff_o_s === (test_vector_s[15:8] - test_vector_s[7:0])) && (borrow_o_s === (test_vector_s[15:8] >= test_vector_s[7:0]));

//stimuli generation
	initial begin
		test_vector_s = 16'h0;
		forever #1 test_vector_s = test_vector_s + 1;
	end

endmodule : subtractor_8_fulltb
