class axi_subscriber extends uvm_subscriber #(axi_seq_item_base);

    `uvm_component_utils(axi_subscriber)


    axi_seq_item_base seqt_subscriber;


    covergroup trsnsf;
    wrt:coverpoint seqt_subscriber.transfer {bins rwt[]={1,0};}
    endgroup

    covergroup wrburst;
     wrb:coverpoint seqt_subscriber.btyp {bins rwb[3]={0,1,2};}
    endgroup

    covergroup wrlen;
    wrl:coverpoint seqt_subscriber.blen {bins rwl[4]={4,12,1,8};}
    endgroup

    covergroup wrsize;
    wrs:coverpoint seqt_subscriber.bsize {bins rws={4};}
    endgroup

    covergroup wdatain;
    wrd:coverpoint seqt_subscriber.datain {bins rwd[4]={[100:1000]};}
    endgroup

    covergroup stwadd;
    stw:coverpoint seqt_subscriber.wadd {bins stwd={[10:500]}with(item%4==0);}
    endgroup

    covergroup stradd;
    str:coverpoint seqt_subscriber.radd {bins strd={[10:500]}with(item%4==0);}
    endgroup

    covergroup rdataout;
    dt:coverpoint seqt_subscriber.dataout {bins dout[4]={[100:1000]};}
    endgroup

   
    covergroup wralined;
    wld:coverpoint seqt_subscriber.wadd {bins wldo={[10:500]}with(item==(item/4)*4);}
    rld:coverpoint seqt_subscriber.radd {bins rldo={[10:500]}with(item==(item/4)*4);}
    endgroup

    covergroup last;
      lst:coverpoint seqt_subscriber.dlast{bins ls[]={0,1};}
    endgroup

    function new(string id="",uvm_component comp);
       super.new(id,comp);
       trsnsf=new();
       wrburst=new();
       wrlen=new();
       wrsize=new();
       stwadd=new();
       stradd=new();
       wdatain=new();
       wralined=new();
       rdataout=new();
       last=new();
    endfunction



     function void write(axi_seq_item_base t);
       seqt_subscriber=t;

       trsnsf.sample();
       wrburst.sample();
       wrlen.sample();
       wrsize.sample();
       stwadd.sample();
       stradd.sample();
       wdatain.sample();
       wralined.sample();
       rdataout.sample();
       last.sample();
       
     endfunction 


endclass
