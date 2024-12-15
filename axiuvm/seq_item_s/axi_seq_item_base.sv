class axi_seq_item_base extends uvm_sequence_item;

    function new(string en="");
       super.new(en);
    endfunction

           bit aclk;
           bit resetn;
      bit transfer;
      bit [8:0] bsize ;
      bit [5:0] blen ;
      bit [1:0] btyp ;
      bit dlast;
      bit [31:0] wadd;
      bit [31:0] radd;
      randc bit [31:0] datain;
           bit [31:0] dataout;

          
           

   

    
    constraint datain_con {datain  inside{[100:1000]};}
    
    


    `uvm_object_utils_begin(axi_seq_item_base)

       `uvm_field_int(aclk,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(resetn,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(wadd,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(blen,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(bsize,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(btyp,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(datain,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(dlast,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(radd,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(transfer,UVM_ALL_ON|UVM_DEC)
       `uvm_field_int(dataout,UVM_ALL_ON|UVM_DEC)
      
    `uvm_object_utils_end




endclass
