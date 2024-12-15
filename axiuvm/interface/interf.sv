interface interf_dut #(parameter size=4)(input aclk,resetn);
    
     logic transfer;
     logic [8:0] bsize ;
     logic [5:0] blen ;
     logic [1:0] btyp ;
     logic dlast;
     logic [(size*8)-1:0] wadd;
     logic [(size*8)-1:0] radd;
     logic [(size*8)-1:0] datain;
     logic [(size*8)-1:0] dataout;

endinterface


interface interf_bfm #(parameter size=4)(input aclk,resetn);
    
     logic transfer;
     logic [8:0] bsize ;
     logic [5:0] blen ;
     logic [1:0] btyp ;
     logic dlast;
     logic [(size*8)-1:0] wadd;
     logic [(size*8)-1:0] radd;
     logic [(size*8)-1:0] datain;
     logic [(size*8)-1:0] dataout;

endinterface



