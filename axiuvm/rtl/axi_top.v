`include "axi_master.v"
`include "axi_slave.v"

module axitop #(parameter size=4,parameter len=8,parameter typ=2) (
    input wire aclk,
    input wire resetn,
    input transfer,
     input [8:0] bsize ,
     input [5:0] blen ,
     input [1:0] btyp ,
     input dlast,
    input wire [(size*8)-1:0] wadd,
    input wire [(size*8)-1:0] radd,
    input wire [(size*8)-1:0] datain,
    output wire [(size*8)-1:0] dataout);

   
    wire  awvalid, awready,wvalid, wready,wlast, bvalid,bready, arvalid,aready, rvalid,rready, rlast;
    wire [1:0] bresp;
    wire [(size*8)-1:0] wdata, awadd, aradd,rdata;

aximaster #(.size(size),.len(len),.typ(typ)) axm1 (
              .aclk(aclk), .resetn(resetn),.bsize(bsize),.blen(blen),.btyp(btyp), .awvalid(awvalid), .wadd(wadd), .radd(radd),
              .awadd(awadd), .aradd(aradd), .awready(awready),.dlast(dlast), .wvalid(wvalid),
              .datain(datain), .wdata(wdata), .wlast(wlast), .wready(wready),
              .bvalid(bvalid), .bresp(bresp), .bready(bready), .rdata(rdata),
              .dataout(dataout), .arvalid(arvalid), .aready(aready),
              .rvalid(rvalid), .rready(rready), .rlast(rlast) );

axislave #(.size(size),.len(len),.typ(typ)) axs1 (
             .aclk(aclk), .resetn(resetn),.transfer(transfer),.bsize(bsize),.blen(blen),.btyp(btyp), .awvalid(awvalid),.awadd(awadd), .awready(awready),
             .wvalid(wvalid), .wdata(wdata), .wlast(wlast), .wready(wready),
             .bvalid(bvalid), .bresp(bresp), .bready(bready), .arvalid(arvalid),
             .aradd(aradd), .aready(aready), .rvalid(rvalid), .rdata(rdata),
             .rready(rready), .rlast(rlast)  );

endmodule


