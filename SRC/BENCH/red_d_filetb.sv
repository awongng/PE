//red_d_filetb.sv
//Test bench for the Barret reduction for Dilithium using test values from a file
//reading the test values from a .txt file
//format for each line in the file :
// product_i result_o

`timescale 1 ns/ 1 ps
module red_d_filetb ();

	logic [45:0] product_i_s;
	logic [22:0] result_o_s;

//DUT
	red_d DUT (
		.product_i(product_i_s),
		.result_o(result_o_s)
	);

	logic [22:0] result_o_ref_s;
	logic correct;
	assign correct = (result_o_s === result_o_ref_s);
//stimuli generation
	initial 
		begin
			int fd;
			fd = $fopen("./TestBenchFiles/red_d_test_val.txt", "r");
			while ($fscanf(fd, "%d %d", product_i_s, result_o_ref_s) == 2)
			begin
				#1;
			end
			$fclose(fd);	
		end
   

endmodule : red_d_filetb
