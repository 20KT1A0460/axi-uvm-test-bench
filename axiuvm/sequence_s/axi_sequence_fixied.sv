class axi_sequence_fixied extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_fixied)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_fixied;

    task body();
      seqt_fixied=axi_seq_item_base::type_id::create("seqt_fixied");
      start_item(seqt_fixied);
      seqt_fixied.transfer=1;
      seqt_fixied.bsize=4;
      seqt_fixied.btyp=1;
      seqt_fixied.blen=1;
      seqt_fixied.wadd=80;
      seqt_fixied.radd=80;
      seqt_fixied.print();
      finish_item(seqt_fixied);
      #40;
      repeat(1)begin
      start_item(seqt_fixied);
      seqt_fixied.randomize();
       $display("axi_sequence");
      seqt_fixied.print();
      finish_item(seqt_fixied);
      #10;
      end
      #20;
     start_item(seqt_fixied);
     seqt_fixied.dlast=1;
     finish_item(seqt_fixied);
    endtask

endclass
