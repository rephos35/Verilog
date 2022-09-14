module pc (clock,reset,pc_cmd,pc_datain,pc_dataout);

input clock, reset, pc_cmd;
input [11:0] pc_datain;
output reg [11:0] pc_dataout;
wire [11:0] pc_next;                       

always@ (posedge clock or posedge reset)
begin
	if(reset)                              
		pc_dataout <= 0;
	else begin
		if(pc_cmd)                             
			pc_dataout <= pc_datain;
	end
end               
endmodule 