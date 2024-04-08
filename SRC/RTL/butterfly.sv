//butterfly.sv
//Single-cycle Cooley-Tukey and Gentleman-Sande butterflies

//sel_butterfly = 0 pour Cooley-Tukey
//sel_butterfly = 1 pour Gentleman-Sande

`timescale 1 ns/ 1 ps
module butterfly (
	input logic [23:0] a_i,
	input logic [23:0] b_i,
	input logic [22:0] twiddle_i,
	input logic sel_red_i, 
	input logic sel_butterfly_i,
	output logic [22:0] a_prime_o,
	output logic [22:0] b_prime_o
	);
//variables internes
	logic [23:0] add_in_s, sub_in_s;
	logic [22:0] mul_in_s, mul_out_s, sub_out_s, q_s;

	assign add_in_s = sel_butterfly_i?b_i:{1'b0,mul_out_s};
	assign sub_in_s = sel_butterfly_i?b_i:{1'b0,mul_out_s};
	assign mul_in_s = sel_butterfly_i?sub_out_s:b_i[22:0];
	assign q_s = sel_red_i?3329:8380417;

	mod_add mod_add (
		.a_i(a_i),
		.b_i(add_in_s),
		.q_i(q_s),
		.c_o(a_prime_o)	
		);

	mod_sub mod_sub (
		.a_i(a_i),
		.b_i(sub_in_s),
		.q_i(q_s),
		.c_o(sub_out_s)	
	);

	mod_mul mod_mul (
		.a_i(twiddle_i),
		.b_i(mul_in_s),
		.select_i(sel_red_i),
		.c_o(mul_out_s)	
	);

	assign b_prime_o = sel_butterfly_i?mul_out_s:sub_out_s;

endmodule : butterfly
