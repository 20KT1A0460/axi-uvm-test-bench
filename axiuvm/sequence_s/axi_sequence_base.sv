class axi_sequence_base extends uvm_sequence#(axi_seq_item_base);
  `uvm_object_utils(axi_sequence_base)
    function new(string en="");
       super.new(en);
    endfunction

    axi_seq_item_base seqt_base;

    task body();
      seqt_base=axi_seq_item_base::type_id::create("seqt_base");
      start_item(seqt_base);
      seqt_base.transfer=1;
      seqt_base.bsize=4;
      seqt_base.btyp=2;
      seqt_base.blen=12;
      seqt_base.wadd=80;
      seqt_base.radd=80;
      seqt_base.print();
      finish_item(seqt_base);
      #40;
      repeat(12)begin
      start_item(seqt_base);
      seqt_base.randomize();
       $display("axi_sequence");
      seqt_base.print();
      finish_item(seqt_base);
      #10;
      end

     start_item(seqt_base);
     seqt_base.dlast=1;
     finish_item(seqt_base);


    endtask

endclass
