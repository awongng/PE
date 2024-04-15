//mod_add_randtb.sv
//Test bench for the modular addition with random values

//Run for as long as necessary

`timescale 1 ns/ 1 ps

module mod_add_randtb ();
	logic [23:0] a_i_s, b_i_s;
	logic [22:0] q_i_s;
	logic [22:0] c_o_s;

	logic [24:0] exp_res;
	logic correct_s;


	mod_add DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.q_i(q_i_s),
		.c_o(c_o_s)	
	);

	assign exp_res = ((a_i_s + b_i_s) < q_i_s) ? ((a_i_s + b_i_s) % 24'h800000) : ((a_i_s + b_i_s - q_i_s) % 24'h800000);
	assign correct_s = (c_o_s === exp_res);

//Stimuli generation
initial begin
	a_i_s = 24'h1;
	b_i_s = 24'h0;
	q_i_s = 24'h1;
	forever #1 begin
		q_i_s = $urandom();
		a_i_s = $urandom_range(q_i_s);
		b_i_s = $urandom_range(q_i_s);
	end
end
   
endmodule : mod_add_randtb
