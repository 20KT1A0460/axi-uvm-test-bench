class axi_dut_monitor extends uvm_monitor;
   `uvm_component_utils(axi_dut_monitor)

    //tlm

    uvm_analysis_port#(axi_seq_item_base) axi_tlm_dut;

      function new(string en="",uvm_component pa);
       super.new(en,pa);
       axi_tlm_dut=new("axi_tlm_dut",this);
    endfunction
    

    virtual interf_dut  in_dut_mon;
    axi_seq_item_base seqt_dut_monitor;

    function void  build_phase (uvm_phase phase);
       seqt_dut_monitor=axi_seq_item_base::type_id::create("seqt_dut_monitor");
       $display("axi_build_dut_monitor");


       if(!uvm_config_db#(virtual interf_dut)::get(this,"","interface_dut",in_dut_mon))
           `uvm_fatal(get_name(),"config_db failed")
       else
           `uvm_info(get_name(),"config_db success",UVM_NONE)
    endfunction
   

    task run_phase(uvm_phase phase);

         forever begin
          @(in_dut_mon.aclk,in_dut_mon.datain,in_dut_mon.dataout);
         seqt_dut_monitor.aclk=in_dut_mon.aclk;
         seqt_dut_monitor.resetn=in_dut_mon.resetn;
         seqt_dut_monitor.transfer=in_dut_mon.transfer;
         seqt_dut_monitor.bsize=in_dut_mon.bsize;
         seqt_dut_monitor.blen=in_dut_mon.blen;
         seqt_dut_monitor.btyp=in_dut_mon.btyp;
         seqt_dut_monitor.wadd=in_dut_mon.wadd;
         seqt_dut_monitor.radd=in_dut_mon.radd;
         seqt_dut_monitor.datain=in_dut_mon.datain;
         seqt_dut_monitor.dlast=in_dut_mon.dlast;
         seqt_dut_monitor.dataout=in_dut_mon.dataout;
         axi_tlm_dut.write(seqt_dut_monitor);
       end 
      
       
    endtask


endclass
