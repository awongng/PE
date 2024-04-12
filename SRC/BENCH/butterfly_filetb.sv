//testbench butterfly
//reading the test values from a .txt file
//format for each line in the file :
// a_i b_i twiddle_i sel_red_i sel_butterfly_i a_out_o b_out_o

`timescale 1 ns/ 1 ps
module butterfly_filetb ();
	logic [23:0] a_s;
	logic [23:0] b_s;
	logic [22:0] twiddle_s;
	logic sel_red_s;
	logic sel_butterfly_s;
	logic [22:0] a_out_s;
	logic [22:0] b_out_s;
//DUT
	butterfly DUT (
		.a_i(a_s),
		.b_i(b_s),
		.twiddle_i(twiddle_s),
		.sel_red_i(sel_red_s),	
		.sel_butterfly_i(sel_butterfly_s),
		.a_out_o(a_out_s),
		.b_out_o(b_out_s)	
	);
	logic [22:0] a_out_ref_s;
	logic [22:0] b_out_ref_s;
	logic correct;
	assign correct = (a_out_s === a_out_ref_s) && (b_out_s === b_out_ref_s);
//stimuli generation
	
	initial 
		begin
			int fd, a, b, w, r, but;
			fd = $fopen("./Tools/TestBenchFiles/butterfly_test_val.txt", "r");
			while ($fscanf(fd, "%d %d %d %d %d %d %d", a_s, b_s, twiddle_s, sel_red_s, sel_butterfly_s, a_out_ref_s, b_out_ref_s) == 7)
			begin
				
				#5;	
		

			end
			$fclose(fd);	
		end

endmodule : butterfly_filetb
