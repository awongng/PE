//mod_sub_simpletb.sv
//Test bench for the modular subtraction on specified values

//Run for 3 ns

`timescale 1 ns/ 1 ps

module mod_sub_simpletb ();
	logic [23:0] a_i_s, b_i_s;
	logic [22:0] q_i_s;
	logic [22:0] c_o_s;

	mod_sub DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.q_i(q_i_s),
		.c_o(c_o_s)	
	);

//Stimuli generation
initial begin
	a_i_s = '0;
	b_i_s = '0;
	q_i_s = 40;
	#1;
	a_i_s = 20;
	b_i_s = 13;
	#1;
	a_i_s = 7;
end

endmodule : mod_sub_simpletb
