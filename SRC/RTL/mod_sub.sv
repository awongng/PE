`timescale 1 ns/ 1 ps

//module soustraction modulaire
module mod_sub (
	input logic [23:0] a_i,
	input logic [23:0] b_i,
	input logic [22:0] q_i,
	output logic [22:0] c_o
	);
//variable interne
	logic borrow_s;
	logic [23:0] c1_s;
	logic [23:0] c2_s;

	subtractor_n #(.nb_bit(24)) subractor(
		.a_i(a_i),
		.b_i(b_i),
		.borrow_o(borrow_s),
		.diff_o(c1_s)	
		);

	assign c2_s = c1_s + {1'b0, q_i};

	assign c_o = borrow_s?c2_s[22:0]:c1_s[22:0];

endmodule : mod_sub
