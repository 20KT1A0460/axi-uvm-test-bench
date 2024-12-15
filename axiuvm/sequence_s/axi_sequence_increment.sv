class axi_sequence_increment extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_increment)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_increment;

    task body();
      seqt_increment=axi_seq_item_base::type_id::create("seqt_increment");
      start_item(seqt_increment);
      seqt_increment.transfer=1;
      seqt_increment.bsize=4;
      seqt_increment.btyp=1;
      seqt_increment.blen=12;
      seqt_increment.wadd=80;
      seqt_increment.radd=80;
      seqt_increment.print();
      finish_item(seqt_increment);
      #40;
      repeat(12)begin
      start_item(seqt_increment);
      seqt_increment.randomize();
       $display("axi_sequence");
      seqt_increment.print();
      finish_item(seqt_increment);
      #10;
      end

     start_item(seqt_increment);
     seqt_increment.dlast=1;
     finish_item(seqt_increment);


    endtask

endclass
