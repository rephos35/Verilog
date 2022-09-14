module register(clock, ra1, rd1, ra2, rd2, r_w, aw, dw);

input	clock, r_w;
input	[11:0] ra1;
input	[11:0] ra2;
input	[11:0] aw;
input	[31:0] dw;
output	[31:0] rd1;
output	[31:0] rd2;
reg		[31:0] registers[0:15];

assign rd1 = (ra1 == 0) ? 32'h00000000 : registers[ra1];
assign rd2 = (ra2 == 0) ? 32'h00000000 : registers[ra2];

always @(posedge clock)begin
	if ( r_w )
		registers[aw] <= dw;
end
endmodule		