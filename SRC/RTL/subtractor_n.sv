`timescale 1 ns/ 1 ps

//module subtractor pour n bit
module subtractor_n #(parameter nb_bit = 1)(
	input logic [nb_bit - 1: 0] a_i,
	input logic [nb_bit - 1: 0] b_i,
	output logic borrow_o,
	output logic [nb_bit - 1: 0] diff_o
	);
//var pour les borrow
	logic [nb_bit - 1: 0] borrow_s;


	half_sub half_sub1 (
		.a_i(a_i[0]),
		.b_i(b_i[0]),
		.borrow_o(borrow_s[0]),
		.diff_o(diff_o[0])	
	);
	genvar i;
	generate
		for (i = 1; i < nb_bit; i ++)
			begin : label1
				subtractor subtractor_inst(
					.a_i(a_i[i]),
					.b_i(b_i[i]),
					.c_i(borrow_s[i-1]),
					.borrow_o(borrow_s[i]),
					.diff_o(diff_o[i])	
				);
			end
	endgenerate
	assign borrow_o = borrow_s[nb_bit -1];

endmodule : subtractor_n
