//mod_mul_simpletb.sv
//Simple test bench for the modular multiplication for a few values

//Run for 6 ns

`timescale 1ns/1ps

module mod_mul_simpletb();
	logic [22:0] a_i_s, b_i_s;
	logic [22:0] c_o_s;
	logic select_i_s;

	mod_mul DUT(
		.a_i(a_i_s),
		.b_i(b_i_s),
		.select_i(select_i_s),
		.c_o(c_o_s)
	);

//Stimuli generation
initial begin
	select_i_s = 1;
	a_i_s = 12'hEA1;
	b_i_s = 12'h6C6;
	//Expected result : d2280,h8E8,b1000 11101000

	#1;
	a_i_s = 12'hB7;
	b_i_s = 12'hABC;
	//Expected result : d205,hCD,b11001101

	#1;
	a_i_s = 12'h7B6;
	b_i_s = 12'hC92;
	//Expected result : d600,h258,b10 01011000

	#1;
	select_i_s = 0;
	a_i_s = 23'h57882B;
	b_i_s = 23'h7F0FEA;
	//Expected result : d3293844,h324294

	#1;
	a_i_s = 23'h4625CA;
	b_i_s = 23'h7F822C;
	//Expected result : d7938152,h792068

	#1;
	a_i_s = 23'h3006BF;
	b_i_s = 23'h762CDA;
	//Expected result : d3190914,h30B082
end

endmodule:mod_mul_simpletb
