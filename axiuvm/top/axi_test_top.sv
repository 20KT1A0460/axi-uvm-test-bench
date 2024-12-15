`include "uvm_macros.svh"
 import uvm_pkg::*;

 `include "../package/axi_pack.sv"
  import  axi_pack::*;

module axi_test_top;

  parameter size=4;
  parameter len=12;
  parameter typ=1;

  bit aclk;
  bit resetn;

  always #5 aclk=~aclk;

  initial begin
  resetn=0;
  #10;
  resetn=1;
  end
  
   interf_dut #(.size(size)) in_dut(.aclk(aclk),.resetn(resetn));
   interf_bfm #(.size(size)) in_bfm(.aclk(aclk),.resetn(resetn));
   
   axitop #(.size(size),.len(len),.typ(typ))dut (
    .aclk(in_dut.aclk), .resetn(in_dut.resetn),.transfer(in_dut.transfer),.bsize(in_dut.bsize),.blen(in_dut.blen),.btyp(in_dut.btyp),
    .dlast(in_dut.dlast), .wadd(in_dut.wadd), .radd(in_dut.radd),.datain(in_dut.datain), .dataout(in_dut.dataout)
    );

  axitop #(.size(size),.len(len),.typ(typ))bfm (
    .aclk(in_bfm.aclk), .resetn(in_bfm.resetn),.transfer(in_bfm.transfer),.bsize(in_bfm.bsize),.blen(in_bfm.blen),.btyp(in_bfm.btyp),
    .dlast(in_bfm.dlast), .wadd(in_bfm.wadd), .radd(in_bfm.radd),.datain(in_bfm.datain), .dataout(in_bfm.dataout)

    );

  axi_assertion axi_as(in_dut);

initial 
    begin
    run_test("axi_test_base");
    end

initial begin
    uvm_config_db#(virtual interf_dut)::set(uvm_root::get(),"*","interface_dut",in_dut);
    end
initial begin
    uvm_config_db#(virtual interf_bfm)::set(uvm_root::get(),"*","interface_bfm",in_bfm);
    end
endmodule



