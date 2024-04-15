//mod_mul_randtb.sv
//Test bench for the modular multiplication with random values

//Run for as long as necessary

`timescale 1ns/1ps

module mod_mul_randtb();
	logic [22:0] a_i_s, b_i_s;
	logic select_i_s;
	logic [22:0 ]c_o_s;
	logic [22:0] modulus_s;

	logic [45:0] exp_res_s;
	logic 	correct_s;

	mod_mul DUT(
		.a_i(a_i_s),
		.b_i(b_i_s),
		.select_i(select_i_s),
		.c_o(c_o_s)
	);

	assign modulus_s = select_i_s ? 3329 : 8380417;
	assign exp_res_s = (a_i_s * b_i_s) % modulus_s;
	assign correct_s = (c_o_s === exp_res_s);

//Stimuli generation
initial begin
	a_i_s = 24'h0;
	b_i_s = 24'h0;
	select_i_s = 0;
	forever #1 begin
		select_i_s = 0;
		a_i_s = $urandom_range(8380417);
		b_i_s = $urandom_range(8380417);
		#1;
		select_i_s = 1;
		a_i_s = $urandom_range(3329);
		b_i_s = $urandom_range(3329);
	end
end

endmodule:mod_mul_randtb
