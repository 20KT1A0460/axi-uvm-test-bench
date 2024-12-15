class axi_test_base extends uvm_test;
   `uvm_component_utils(axi_test_base)
   
    function new(string en="",uvm_component pa);
       super.new(en,pa);
     endfunction
     
     axi_sequence_base axi_seq_base;
     axi_env axi_en;
    
     function void build_phase(uvm_phase phase);
          axi_en=axi_env::type_id::create("axi_en",this);
          axi_seq_base=axi_sequence_base::type_id::create("axi_seq_base");
     endfunction

     function void end_of_elaboration_phase(uvm_phase phase);
       uvm_top.print_topology();
     endfunction


     task run_phase(uvm_phase phase);
       phase.raise_objection(this);
          axi_seq_base.start(axi_en.axi_act_ag.axi_sqr);
         #200;
       phase.drop_objection(this);
     endtask



 
endclass
