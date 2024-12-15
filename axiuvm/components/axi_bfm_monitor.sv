class axi_bfm_monitor extends uvm_monitor;
   `uvm_component_utils(axi_bfm_monitor)

       

    virtual interf_bfm  in_bfm_mon;
    axi_seq_item_base seqt_bfm_monitor;

    //tlm

    uvm_analysis_port#(axi_seq_item_base) axi_tlm_bfm;


     function new(string en="",uvm_component pa);
       super.new(en,pa);
      
       axi_tlm_bfm=new("axi_tlm_bfm",this);

    endfunction


    function void  build_phase (uvm_phase phase);
       seqt_bfm_monitor=axi_seq_item_base::type_id::create("seqt_bfm_monitor");

       $display("axi_build_bfm_monitor");


       if(!uvm_config_db#(virtual interf_bfm)::get(this,"","interface_bfm",in_bfm_mon))
           `uvm_fatal(get_name(),"config_db failed")
       else
           `uvm_info(get_name(),"config_db success",UVM_NONE)
    endfunction
   

    task run_phase(uvm_phase phase);


     
    forever begin
      @(in_bfm_mon.aclk,in_bfm_mon.datain,in_bfm_mon.dataout);
         seqt_bfm_monitor.aclk=in_bfm_mon.aclk;
         seqt_bfm_monitor.resetn=in_bfm_mon.resetn;
         seqt_bfm_monitor.transfer=in_bfm_mon.transfer;
         seqt_bfm_monitor.bsize=in_bfm_mon.bsize;
         seqt_bfm_monitor.blen=in_bfm_mon.blen;
         seqt_bfm_monitor.btyp=in_bfm_mon.btyp;
         seqt_bfm_monitor.wadd=in_bfm_mon.wadd;
         seqt_bfm_monitor.radd=in_bfm_mon.radd;
         seqt_bfm_monitor.datain=in_bfm_mon.datain;
         seqt_bfm_monitor.dlast=in_bfm_mon.dlast;
         seqt_bfm_monitor.dataout=in_bfm_mon.dataout;
         axi_tlm_bfm.write(seqt_bfm_monitor);
       end 
     

    endtask


endclass
