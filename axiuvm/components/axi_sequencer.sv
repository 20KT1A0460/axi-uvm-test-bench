class axi_sequencer extends uvm_sequencer#(axi_seq_item_base);
  `uvm_component_utils(axi_sequencer)

    function new(string en="",uvm_component pa);
       super.new(en,pa);
    endfunction

endclass
