//testbench butterfly
//reading the test values from a .txt file
//format for each line in the file :
// a_i b_i twiddle_i sel_red_i sel_butterfly_i a_o b_o

`timescale 1 ns/ 1 ps
module butterfly_filetb ();
	logic [23:0] a_i_s;
	logic [23:0] b_i_s;
	logic [22:0] twiddle_s;
	logic sel_red_s;
	logic sel_butterfly_s;
	logic [22:0] a_o_s;
	logic [22:0] b_o_s;
//DUT
	butterfly DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.twiddle_i(twiddle_i_s),
		.sel_red_i(sel_red_i_s),	
		.sel_butterfly_i(sel_butterfly_i_s),
		.a_o(a_o_s),
		.b_o(b_o_s)	
	);
	logic [22:0] a_o_ref_s;
	logic [22:0] b_o_ref_s;
	logic correct;
	assign correct = (a_o_s === a_o_ref_s) && (b_o_s === b_o_ref_s);
//stimuli generation
	
	initial 
		begin
			int fd, a, b, w, r, but;
			fd = $fopen("./TestBenchFiles/butterfly_test_val.txt", "r");
			while ($fscanf(fd, "%d %d %d %d %d %d %d", a_i_s, b_i_s, twiddle_i_s, sel_red_i_s, sel_butterfly_i_s, a_o_ref_s, b_o_ref_s) == 7)
			begin
				
				#5;	
		

			end
			$fclose(fd);	
		end

endmodule : butterfly_filetb
