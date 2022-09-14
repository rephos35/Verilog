module alu(clock, alu_src1, alu_src2, op, out, c, e, p, z, n);
parameter bits = 32;
parameter ops = 4;
parameter bra   = 4'b0001,
		  ld    = 4'b0010,
		  add	= 4'b0100,
		  mul	= 4'b0101,
		  cmp	= 4'b0110,
		  shl	= 4'b0111,
		  rol	= 4'b1000;
		  
input	clock;
input 	[bits-1:0] alu_src1,alu_src2;
input	[ops-1:0] op;
output	[bits:0] out;		  
output c;
output e;
output p;
output z;
output n;

reg[bits:0] alu;

	assign c = alu[bits];
	assign e = ~alu[0];
	assign p = ^alu;
	assign z = ~alu;
	assign n = alu[bits-1];
	assign out = alu;
	
	always@(posedge clock)begin
		case(op)
			bra:
				alu<=alu_src2;
			ld:
				alu<=alu_src1;
			add:
				alu<=alu_src1+alu_src2;
			mul:
				alu<=alu_src1*alu_src2;
			cmp:
				alu<=~alu_src1;
			shl:
				alu<=alu_src1<<1;
			rol:begin
				alu[bits:1]<=alu_src1<<1;
				alu[0]<=alu_src1[bits-1];
			end
			default:
					alu<={bits{1'bx}};
	endcase
end
endmodule	

