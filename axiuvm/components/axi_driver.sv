class axi_driver extends uvm_driver #(axi_seq_item_base);
   `uvm_component_utils(axi_driver)

    function new(string en="",uvm_component pa);
       super.new(en,pa);
    endfunction
    
    virtual interf_dut in_dut_dr;
    virtual interf_bfm  in_bfm_dr;
    axi_seq_item_base seqt_dr;

    function void build_phase (uvm_phase phase);
     seqt_dr=axi_seq_item_base::type_id::create("seqt_dr");
     
       if(!uvm_config_db#(virtual interf_dut)::get(this,"","interface_dut",in_dut_dr))
           `uvm_fatal(get_name(),"config_db failed")
       else
           `uvm_info(get_name(),"config_db success",UVM_NONE)

       if(!uvm_config_db#(virtual interf_bfm)::get(this,"","interface_bfm",in_bfm_dr))
           `uvm_fatal(get_name(),"config_db failed")
       else
           `uvm_info(get_name(),"config_db success",UVM_NONE)


    endfunction 



    task run_phase(uvm_phase phase);
     forever begin
      seq_item_port.get_next_item(seqt_dr);

      uvm_report_info(get_type_name(),"driving dut && bfm");
      seqt_dr.print();
  
          
       in_dut_dr.transfer=seqt_dr.transfer;    
       in_bfm_dr.transfer=seqt_dr.transfer;
       in_dut_dr.bsize=seqt_dr.bsize;           
       in_bfm_dr.bsize=seqt_dr.bsize;
       in_dut_dr.blen=seqt_dr.blen;             
       in_bfm_dr.blen=seqt_dr.blen;
       in_dut_dr.btyp=seqt_dr.btyp;           
       in_bfm_dr.btyp=seqt_dr.btyp;
       in_dut_dr.wadd=seqt_dr.wadd;            
       in_bfm_dr.wadd=seqt_dr.wadd;
       in_dut_dr.radd=seqt_dr.radd;             
       in_bfm_dr.radd=seqt_dr.radd;
       in_dut_dr.datain=seqt_dr.datain;        
       in_bfm_dr.datain=seqt_dr.datain;
       in_dut_dr.dlast=seqt_dr.dlast;           
       in_bfm_dr.dlast=seqt_dr.dlast;

 
      seq_item_port.item_done();

     end

    endtask

endclass
