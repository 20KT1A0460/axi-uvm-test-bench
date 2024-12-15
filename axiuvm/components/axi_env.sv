class axi_env extends uvm_env;
  `uvm_component_utils(axi_env)
  
     function new(string en="",uvm_component pa);
       super.new(en,pa);
     endfunction


   axi_act_agent axi_act_ag;
   axi_pas_agent axi_pas_ag;
   axi_scoreboard axi_scrb;
   axi_subscriber axi_subr;

   function void build_phase(uvm_phase phase);
     axi_act_ag=axi_act_agent::type_id::create("axi_act_ag",this);
     axi_pas_ag=axi_pas_agent::type_id::create("axi_pas_ag",this);
     axi_scrb=axi_scoreboard::type_id::create("axi_scrb",this);
     axi_subr=axi_subscriber::type_id::create("axi_subr",this);

   endfunction


   function void connect_phase(uvm_phase phase);
     axi_act_ag.axi_bfm_mon. axi_tlm_bfm.connect(axi_scrb.axi_tlm_bfm_scrb);
     axi_pas_ag.axi_dut_mon.axi_tlm_dut.connect(axi_scrb.axi_tlm_dut_scrb);
     axi_pas_ag.axi_dut_mon.axi_tlm_dut.connect(axi_subr.analysis_export);      
   endfunction
endclass
