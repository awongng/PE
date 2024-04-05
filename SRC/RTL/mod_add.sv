`timescale 1 ns/ 1 ps

//module addition modulaire
module mod_add (
	input logic [23:0] a_i,
	input logic [23:0] b_i,
	input logic [22:0] q_i,
	output logic [22:0] c_o
	);
//variable interne
	logic borrow_s;
	logic [23:0] c1_s;
	logic [23:0] c2_s;

	assign c1_s = a_i + b_i;


	subtractor_n #(.nb_bit(24)) subractor(
		.a_i(c1_s),
		.b_i({0, q_i}),
		.borrow_o(borrow_s),
		.diff_o(c2_s)	
		);
	

	assign c_o = borrow_s?c1_s[22:0]:c2_s[22:0];

endmodule : mod_add
