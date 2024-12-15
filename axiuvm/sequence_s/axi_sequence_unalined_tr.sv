class axi_sequence_unalined_tr extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_unalined_tr)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_unal_tr;

    task body();
      seqt_unal_tr=axi_seq_item_base::type_id::create("seqt_unal_tr");
      start_item(seqt_unal_tr);
      seqt_unal_tr.transfer=1;
      seqt_unal_tr.bsize=4;
      seqt_unal_tr.btyp=2;
      seqt_unal_tr.blen=12;
      seqt_unal_tr.wadd=105;
      seqt_unal_tr.radd=105;
      seqt_unal_tr.print();
      finish_item(seqt_unal_tr);
      #40;
      repeat(12)begin
      start_item(seqt_unal_tr);
      seqt_unal_tr.randomize();
       $display("axi_sequence");
      seqt_unal_tr.print();
      finish_item(seqt_unal_tr);
      #10;
      end

     start_item(seqt_unal_tr);
     seqt_unal_tr.dlast=1;
     finish_item(seqt_unal_tr);


    endtask

endclass
