class axi_act_agent extends uvm_agent;
    `uvm_component_utils(axi_act_agent)

       function new(string en="",uvm_component pa);
       super.new(en,pa);
       endfunction


       axi_sequencer axi_sqr;
       axi_driver axi_dr;
       axi_bfm_monitor axi_bfm_mon;


       function void build_phase(uvm_phase phase);
         axi_sqr=axi_sequencer::type_id::create("axi_sqr",this);
         axi_dr=axi_driver::type_id::create("axi_dr",this);
         axi_bfm_mon=axi_bfm_monitor::type_id::create("axi_bfm_mon",this);
       endfunction


       function void connect_phase(uvm_phase phase);
          axi_dr.seq_item_port.connect(axi_sqr.seq_item_export);
       endfunction


endclass
