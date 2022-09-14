module psr(clock, psr_dataout, psr_datain, psr_cmd);
	
input clock;
input psr_cmd;
input [4:0]psr_datain;
output reg [4:0]psr_dataout;
reg [4:0]register;

always@(posedge clock)begin
	if(psr_cmd)
		register = psr_datain;
	else begin
		psr_dataout = register;
	end
end
endmodule
