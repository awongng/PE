//Name of file
//Description of test bench

//Additional information

`timescale 1ps/1ns

module module_name_suffixtb ();//suffixes are described in Implementation.md
    //List all of the module under test's I/Os, inputs then outputs
    logic [31:0] input_example_1_i_s;
    logic input_example_2_i_s;
    logic [15:0] output_example_o_s;
    //Internal signals such as (when applicable)
    logic [15:0] exp_res_s;//expected result
    logic correct_s;//boolean indicating expected behavior of DUT

    module_name DUT (
        .input_example_1_i(input_example_1_i_s),
        .input_example_2_i(input_example_2_i_s),
        .output_example_o(output_example_o_s)
    );

    assign correct_s = (output_example_o === exp_res_s);//when applicable

//stimuli generation
//For *_simpletb.sv
initial begin
    input_example_1_i_s = 32'hFFFFFFFFFF;
    input_example_2_i_s = 0;
    #1;
    input_example_1_i_s = 32'b1101001111110010101;
    input_example_2_i_s = ~input_example_2_i_s;
end
//For *_randtb.sv
initial begin
    input_example_1_i_s = 0;//Initial case is not required
    input_example_2_i_s = 0;//----------------------------
    forever #1 begin
        input_example_1_i_s = $urandom_range(#max);//Random between 0 and #max, both included
        input_example_2_i_s = $urandom();//Unbound random
    end
end
//For *_filetb.sv
iletb.sv
initial begin
    int fd;
    fd = $fopen("./TestBenchFiles/module_name_test_val.txt", "r");
	while ($fscanf(fd, "%d %d %d", input_example_1_i_s, input_example_2_i_s, output_example_o_s) == 3)
	begin
		#1;
	end
	$fclose(fd);	
end
//For *_fulltb.sv
//Implementation may vary

endmodule : module_name_suffixtb