class axi_sequence_wrp_4tr extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_wrp_4tr)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_wrp_4tr;

    task body();
      seqt_wrp_4tr=axi_seq_item_base::type_id::create("seqt_wrp_4tr");
      start_item(seqt_wrp_4tr);
      seqt_wrp_4tr.transfer=1;
      seqt_wrp_4tr.bsize=4;
      seqt_wrp_4tr.btyp=2;
      seqt_wrp_4tr.blen=4;
      seqt_wrp_4tr.wadd=80;
      seqt_wrp_4tr.radd=80;
      seqt_wrp_4tr.print();
      finish_item(seqt_wrp_4tr);
      #40;
      repeat(4)begin
      start_item(seqt_wrp_4tr);
      seqt_wrp_4tr.randomize();
       $display("axi_sequence");
      seqt_wrp_4tr.print();
      finish_item(seqt_wrp_4tr);
      #10;
      end

     start_item(seqt_wrp_4tr);
     seqt_wrp_4tr.dlast=1;
     finish_item(seqt_wrp_4tr);


    endtask

endclass
