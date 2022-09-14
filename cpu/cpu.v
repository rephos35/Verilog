module cpu(input clock, reset);

control c1(clock, reset, c, e, p, z, n, pc_dataout, op, cc, s_a, de_a, rf_data1, rf_data2, alu_result,
			m_data,
			pc_cmd, ir_cmd,rf_write, psr_cmd, m_rw_, pc_datain, ir_datain, rf_dataw, rf_addrw, rf_addr1, rf_addr2, alu_src1, alu_src2,
			alu_function, psr_datain, m_addr
);
pc p1(clock, reset, pc_cmd, pc_datain, pc_dataout);
memory m1(clock, reset, m_addr, m_data, m_rw_);
ir i1(clock, reset, ir_cmd, ir_datain, op, cc, s_a, de_a);
register r1(clock, rf_addr1, rf_data1, rf_addr2, rf_data2, rf_write, rf_addrw, rf_dataw);
alu a1(clock, alu_src1, alu_src2, alu_function, alu_result, c, e, p, z, n);
psr s1(clock, psr_dataout, psr_datain, psr_cmd);

endmodule 