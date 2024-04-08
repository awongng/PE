//testbench butterfly

`timescale 1 ns/ 1 ps
module butterfly_tb ();
	logic [23:0] a_s;
	logic [23:0] b_s;
	logic [22:0] twiddle_s;
	logic sel_red_s;
	logic sel_butterfly_s;
	logic [22:0] a_prime_s;
	logic [22:0] b_prime_s;
//DUT
	butterfly DUT (
		.a_i(a_s),
		.b_i(b_s),
		.twiddle_i(twiddle_s),
		.sel_red_i(sel_red_s),	
		.sel_butterfly_i(sel_butterfly_s),
		.a_prime_o(a_prime_s),
		.b_prime_o(b_prime_s)	
	);

//stimuli generation
	initial 
		begin
			a_s = 3210;
			b_s = 19;
			twiddle_s = 281;
			sel_red_s = 1;//Kyber
			sel_butterfly_s = 0;

			#100 a_s = 1891;
			b_s = 1200;
			sel_butterfly_s = 1;

			
			#100 a_s = 8297430;
			b_s = 7194;
			twiddle_s = 400232;
			sel_red_s = 0; //Dilithium
			sel_butterfly_s = 0;

			#100 a_s = 4702990;
			b_s = 3511453;
			sel_butterfly_s = 1;

		end

endmodule : butterfly_tb
