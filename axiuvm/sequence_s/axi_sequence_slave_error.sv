class axi_sequence_slave_error extends axi_sequence_base;
  `uvm_object_utils(axi_sequence_slave_error)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_sl_er;

    task body();
      seqt_sl_er=axi_seq_item_base::type_id::create("seqt_sl_er");
      start_item(seqt_sl_er);
      seqt_sl_er.transfer=1;
      seqt_sl_er.bsize=4;
      seqt_sl_er.btyp=2;
      seqt_sl_er.blen=12;
      seqt_sl_er.wadd=550;
      seqt_sl_er.radd=550;
      seqt_sl_er.print();
      finish_item(seqt_sl_er);
      #40;
      repeat(12)begin
      start_item(seqt_sl_er);
      seqt_sl_er.randomize();
       $display("axi_sequence");
      seqt_sl_er.print();
      finish_item(seqt_sl_er);
      #10;
      end

     start_item(seqt_sl_er);
     seqt_sl_er.dlast=1;
     finish_item(seqt_sl_er);


    endtask

endclass
