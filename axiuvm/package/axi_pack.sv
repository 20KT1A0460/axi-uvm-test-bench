 `include "../interface/interf.sv"
 `include "../rtl/axi_top.v"
 `include "../assertion/axi_assertion.sv"
  package axi_pack;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "../seq_item_s/axi_seq_item_base.sv"
  `include "../sequence_s/axi_sequence_include.sv"
  `include "../components/axi_component_base.sv"
  `include "../testcase_s/axi_test_include.sv"

  endpackage
