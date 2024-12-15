module axi_assertion(interf_dut in_dut);


property trnsfr;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.transfer ;
endproperty

property size;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.bsize==4;
endproperty

property burst;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.btyp inside {0,1,2};
endproperty

property len;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.blen inside{4,12,8};
endproperty

property stwadd;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.wadd inside{[0:500]};
endproperty

property stradd;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.radd inside{[0:500]};
endproperty

property wrdata;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  ##4 in_dut.datain inside{[100:1000]};
endproperty

property rdata;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn) ##10 in_dut.dataout inside{[100:1000]};
endproperty



property walined;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.wadd==(in_dut.wadd/in_dut.bsize)*in_dut.bsize;
endproperty

property ralined;
@(posedge in_dut.aclk) disable iff(!in_dut.resetn)  in_dut.radd==(in_dut.radd/in_dut.bsize)*in_dut.bsize;
endproperty


axi_trnsfr:assert property(trnsfr);
axi_size:assert property(size);
axi_len:assert property(len);
axi_burst:assert property(burst);
axi_stwadd:assert property(stwadd);
axi_stradd:assert property(stradd);
axi_wrdata:assert property(wrdata);
axi_rdata:assert property(rdata);
axi_walined:assert property(walined);
axi_ralined:assert property(ralined);

endmodule
