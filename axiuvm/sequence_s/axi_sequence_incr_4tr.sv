class axi_sequence_incr_4tr extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_incr_4tr)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_incr_4tr;

    task body();
      seqt_incr_4tr=axi_seq_item_base::type_id::create("seqt_incr_4tr");
      start_item(seqt_incr_4tr);
      seqt_incr_4tr.transfer=1;
      seqt_incr_4tr.bsize=4;
      seqt_incr_4tr.btyp=2;
      seqt_incr_4tr.blen=4;
      seqt_incr_4tr.wadd=80;
      seqt_incr_4tr.radd=80;
      seqt_incr_4tr.print();
      finish_item(seqt_incr_4tr);
      #40;
      repeat(4)begin
      start_item(seqt_incr_4tr);
      seqt_incr_4tr.randomize();
       $display("axi_sequence");
      seqt_incr_4tr.print();
      finish_item(seqt_incr_4tr);
      #10;
      end

     start_item(seqt_incr_4tr);
     seqt_incr_4tr.dlast=1;
     finish_item(seqt_incr_4tr);


    endtask

endclass
