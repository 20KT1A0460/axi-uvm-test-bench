class axi_sequence_wrapping extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_wrapping)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_wrapping;

    task body();
      seqt_wrapping=axi_seq_item_base::type_id::create("seqt_wrapping");
      start_item(seqt_wrapping);
      seqt_wrapping.transfer=1;
      seqt_wrapping.bsize=4;
      seqt_wrapping.btyp=2;
      seqt_wrapping.blen=12;
      seqt_wrapping.wadd=80;
      seqt_wrapping.radd=80;
      seqt_wrapping.print();
      finish_item(seqt_wrapping);
      #40;
      repeat(12)begin
      start_item(seqt_wrapping);
      seqt_wrapping.randomize();
       $display("axi_sequence");
      seqt_wrapping.print();
      finish_item(seqt_wrapping);
      #10;
      end

     start_item(seqt_wrapping);
     seqt_wrapping.dlast=1;
     finish_item(seqt_wrapping);


    endtask

endclass
