module ir (clock, reset, ir_cmd, ir_datain, op, cc, s_a, de_a);

input clock,reset,ir_cmd;
input [31:0] ir_datain;
output reg [3:0] op;
output reg [11:0] s_a;
output reg [11:0] de_a;
output reg [3:0] cc;

always @(posedge clock or posedge reset) begin
	if (reset) begin
	    op <= 0;
	    cc    <= 0;
	    s_a <= 0;
	    de_a <= 0;	    			
	end
	else if (ir_cmd) begin
	    op <= ir_datain[31:28];
	    cc    <= ir_datain[27:24];
	    s_a <= ir_datain[23:12];
	    de_a <= ir_datain[11:0];				
	end
end
endmodule
