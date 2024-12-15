class  axi_pas_agent extends uvm_agent;
    `uvm_component_utils(axi_pas_agent)

       function new(string en="",uvm_component pa);
       super.new(en,pa);
       endfunction

       axi_dut_monitor axi_dut_mon;

       function void build_phase(uvm_phase phase);
          axi_dut_mon=axi_dut_monitor::type_id::create("axi_dut_mon",this);
          $display("axi_build_pas_agent");

       endfunction

endclass
